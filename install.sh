#/!bin/bash

red=$'\e[1;31m'
grn=$'\e[1;32m'
blue=$'\e[1;34m'
mag=$'\e[1;35m'
cyn=$'\e[1;36m'
white=$'\e[0m'
yellow=$'\e[0;33m'

function thunder {
	echo "$yellow$white"
}
function confirm {
	echo " $grn $1 completed $white"
	echo
}
aurPackages=(
	"
	polybar
	betterlockscreen-git
	insomnia
	ngrok
	pgweb-bin
	robo3t-bin
	light-git
	xkb-switch
	lightdm-webkit-theme-litarvan
	visual-studio-code-bin
	direnv
	ttf-weather-icons
	slack-desktop
	spotify"
)
applications=(
	"
	tmux
	atom
	parcellite
	messengerfordesktop
	docker
	docker-compose
	mongodb"
)
stowed=(
	"
	compton
	dunst
	i3
	idea
	mimeapps
	nvim
	polybar
	ranger
	redshift
	rofi
	terminator
	tmux"
)
createFolders=(
	"mkdir -p /home/$USER/tmp/;
	 mkdir -p /home/$USER/Pictures/Wallpapers;
	 mkdir -p /home/$USER/Pictures/screenshots"
)
basicPackages=(
	"
	tmux
	rofi
	compton
	neovim
	redshift
	dunst
	terminator
	gpicview
	jq
	feh
	maim
	xclip
	arandr
	w3m
	the_silver_searcher
	lxappearance
	playerctl
	dialog
	xcursor-breeze
	mplayer
	ttf-droid
	awesome-terminal-fonts
	papirus-icon-theme
	zsh"
)
function installZsh {
	echo "Installed zsh"
 # wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh
 # yaourt -s --noconfirm zsh-autosuggestions
}
function prompt {
	while true; do
	echo -e "$1"
	read -p "Press$red n$white to skip this step, or$blue y$white to continue: " choice
	case "$choice" in
	  y|Y ) $2; break;;
	  n|N ) echo "Skipping this step"; break;;
	  * ) echo "Please press$red n$white, or$blue y$white";;
	esac
done
}
function checkMissingPackages {
	declare -a arr=("stow" "compton" "dunst" "i3" "nvim" "polybar" "redshift" "rofi" "terminator" "tmux" "zsh")
	echo "Checking if there are any missing packages"
	for item in "${arr[@]}"
	do
		if ! [ -x "$(command -v $item)" ]; then
			echo "$red  Error: $item is not installed.$white" >&2
			exit 1
		fi
		# or do whatever with individual element of the array
	done
}

thunder
prompt "  Will install:$blue $basicPackages $white" "sudo pacman -S $basicPackages"
confirm "Installing basic packages"

thunder
prompt "  Will install: $blue oh-my-zsh $white" "installZsh"
confirm "Installing oh-my-zsh"

checkMissingPackages
echo " $grn No missing packages were found $white"

prompt "Will use stow to symlink: $blue $stowed $white" "stow $stowed"
confirm "Symlink with stow"

prompt "Will change button positions on windows" "gsettings set org.gnome.desktop.wm.preferences button-layout 'close,maximize,minimize:'"
confirm "Changed position of window buttons to left side (gnome)"

thunder
prompt "  Will install tmux plugin manager (tpm)" "git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm"
confirm "Installing tmux plugin manager"

thunder
prompt "  Will install: $blue $applications $white" "sudo pacman -S atom parcellite messengerfordesktop docker docker-compose mongodb"
confirm "Installing applications"

thunder
prompt "  Will install: $blue bluetooth tools $white" "sudo pacman -S pulseaudio-alsa pulseaudio-bluetooth bluez bluez-libs bluez-utils bluez-firmware blueberry"
confirm "Installing bluetooth tools"

thunder
prompt "  Will install: $blue $aurPackages $white" "yaourt --noconfirm -S $aurPackages"
confirm "Installing aur packages"

prompt "Will create `/data/db` for mongodb" "sudo mkdir -p /data/db"
prompt "Will add permissions for current user for mongo" "sudo chown -R $USER /data/db"
prompt "Adding permissions for current user for docker" "sudo usermod -aG docker ${USER}"
confirm "Procedures for mongodb and docker"

echo "🎉🎉🎉🎉🎉🎉🎉🎉🎉🎉🎉🎉🎉🎉🎉🎉🎉🎉🎉🎉🎉🎉🎉🎉🎉🎉🎉🎉🎉"
echo "Script completed. Please restart for the changes to take effect"
