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
	adwaita-dark
	betterlockscreen-git
	direnv
	light-git
	nerd-fonts-source-code-pro
	polybar
	slack-desktop
	spaceship-prompt-git
	spotify
	ttf-weather-icons
	visual-studio-code-bin
	xkb-switch
	zsh-you-should-use"
)
applications=(
	"
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
	mimeapps
	nvim
	parcellite
	polybar
	ranger
	redshift
	rofi
	terminator
	tmux"
)
function createFolders {
	"mkdir -p /home/$USER/tmp/;
	 mkdir -p /home/$USER/Documents;
	 mkdir -p /home/$USER/Download;
	 mkdir -p /home/$USER/Music;
	 mkdir -p /home/$USER/Personal;
	 mkdir -p /home/$USER/Public;
	 mkdir -p /home/$USER/Videos;
	 mkdir -p /home/$USER/Work;
	 mkdir -p /home/$USER/Pictures/Wallpapers;
	 mkdir -p /home/$USER/Pictures/screenshots"
}

basicPackages=(
	"
	adobe-source-code-pro-fonts
	arandr
	aurman
	awesome-terminal-fonts
	compton
	dialog
	dunst
	feh
	gnome-themes-extra
	gpicview
	i3-gaps
	i3status
	jq
	lxappearance
	maim
	mplayer
	nautilus
	neovim
	noto-fonts-emoji
	pacman-contrib
	papirus-icon-theme
	playerctl
	python-pywal
	ranger
	redshift
	rofi
	stow
	terminator
	the_silver_searcher
	tmux
	ttf-droid
	w3m
	xclip
	xcursor-breeze
	xorg-server
	xorg-xinit
	zsh"
)

function installZsh {
	echo "source $HOME/dotfiles/zsh/.zshrc
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh" > /home/$USER/.zshrc
	wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh
	aurman -S --noconfirm zsh-autosuggestions
	chsh -s `which zsh`
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
	declare -a arr=("stow" "compton" "dunst" "i3" "nvim" "polybar" "redshift" "rofi" "parcellite" "terminator" "tmux" "zsh")
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

prompt "Will create Pictures and tmp folder" "createFolders"
confirm "Creating folders"

thunder
prompt "  Will install:$blue $basicPackages $white" "sudo pacman -S $basicPackages"
confirm "Installing basic packages"

thunder
prompt "  Will install: $blue $aurPackages $white" "aurman --noconfirm -S $aurPackages"
confirm "Installing aur packages"

thunder
prompt "  Will install: $blue oh-my-zsh $white" "installZsh"
confirm "Installing oh-my-zsh"

prompt "Will use stow to symlink: $blue $stowed $white" "stow $stowed"
confirm "Symlink with stow"

prompt "Will configure ranger shortcuts" "./scripts/shortcuts/shortcuts.sh"

prompt "Will change button positions on windows" "gsettings set org.gnome.desktop.wm.preferences button-layout 'close,maximize,minimize:'"
confirm "Changed position of window buttons to left side (gnome)"

thunder
prompt "  Will install tmux plugin manager (tpm)" "git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm"
confirm "Installing tmux plugin manager"

thunder
prompt "  Will install: $blue $applications $white" "sudo pacman -S $applications"
confirm "Installing applications"

thunder
prompt "  Will install: $blue bluetooth tools $white" "sudo pacman -S pulseaudio-alsa pulseaudio-bluetooth bluez bluez-libs bluez-utils bluez-firmware blueberry"
confirm "Installing bluetooth tools"

prompt "Will create /data/db for mongodb" "sudo mkdir -p /data/db"
prompt "Will add permissions for current user for mongo" "sudo chown -R $USER /data/db"
prompt "Adding permissions for current user for docker" "sudo usermod -aG docker ${USER}"
confirm "Procedures for mongodb and docker"

checkMissingPackages
echo " $grn No missing packages were found $white"

prompt "Will install tlp" "sudo pacman -S tlp tlp-rdw acpi_call ethtool smartmontools"
confirm "tlp"
sudo stow -t / tlp
sudo systemctl start tlp.service
sudo systemctl enable tlp.service
sudo systemctl enable tlp-sleep.service
sudo systemctl start tlp-sleep.service
sudo systemctl mask systemd-rfkill.service

echo "🎉🎉🎉🎉🎉🎉🎉🎉🎉🎉🎉🎉🎉🎉🎉🎉🎉🎉🎉🎉🎉🎉🎉🎉🎉🎉🎉🎉🎉"
echo "Script completed. Please restart for the changes to take effect"
