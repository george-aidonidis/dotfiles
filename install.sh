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

aurPackages=("autotiling redshift-wlr-gamma-control-git network-manager-applet-indicator direnv enpass-bin google-chrome light-git nerd-fonts-source-code-pro spaceship-prompt-git ttf-lato ttf-weather-icons xkb-switch xkblayout-state-git xidlehook")
applications=("flameshot docker docker-compose parcellite")
stowed=("applications config-dotfiles homeconfig terminals wm")

function createFolders {
	mkdir -p $HOME/tmp/;
	mkdir -p $HOME/Documents;
	mkdir -p $HOME/Download;
	mkdir -p $HOME/Music;
	mkdir -p $HOME/Personal;
	mkdir -p $HOME/Public;
	mkdir -p $HOME/Videos;
	mkdir -p $HOME/Work;
	mkdir -p $HOME/Pictures/Wallpapers;
	mkdir -p $HOME/Pictures/screenshots;
}

basicPackages=("adobe-source-code-pro-fonts arandr arc-gtk-theme alsa-lib alsa-utils alsa-plugins awesome-terminal-fonts picom cronie dialog diff-so-fancy dunst feh fwupd gnome-themes-extra gpicview gsimplecal grim wl-clipboard htop i3-gaps i3status jq lsd lxappearance npm maim mplayer nautilus neofetch neovim noto-fonts-emoji pacman-contrib papirus-icon-theme pigz polybar playerctl python-dbus python-pywal ranger redshift rofi slurp sxiv stow terminator the_silver_searcher ttf-droid ttf-ubuntu-font-family w3m xclip xcursor-breeze xorg-server xorg-xinit xsel yay z zsh")

function installZsh {
	echo "source $HOME/dotfiles/zsh/.zshrc
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh" > /home/$USER/.zshrc
	wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh
	yay -S --noconfirm zsh-autosuggestions
	yay -S --noconfirm zsh-you-should-use
	yay -S --noconfirm zsh-syntax-highlighting
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
	declare -a arr=("picom" "dunst" "gsimplecal" "i3" "kitty" "mako" "nvim" "parcellite" "polybar" "redshift" "rofi" "stow" "terminator" "waybar" "zsh")
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
function stowThings {
	 rm $HOME/.zshrc;
	 stow $stowed;
 }

# Use all cores for compilation.
sed -i "s/-j2/-j$(nproc)/;s/^#MAKEFLAGS/MAKEFLAGS/" /etc/makepkg.conf

# Make pacman and yay colorful and adds eye candy on the progress bar because why not.
sed -i "s/^#Color/Color/g;/#VerbosePkgLists/a ILoveCandy" /etc/pacman.conf

prompt "Will update current packages before installation" "sudo pacman -Syu"
confirm "Update"

prompt "Will create Pictures and tmp folder" "createFolders"
confirm "Creating folders"

thunder
prompt "  Will install:$blue $basicPackages $white" "sudo pacman -S $basicPackages"
confirm "Installing basic packages"

thunder
prompt "  Will install: $blue $aurPackages $white" "yay --noconfirm -S $aurPackages"
confirm "Installing aur packages"

thunder
prompt "  Will install discord" "yay -S --needed --noconfirm --mflags --nocheck libc++abi libc++ discord"
confirm "Installing discord"

thunder
prompt "  Will install: $blue oh-my-zsh $white" "installZsh"
confirm "Installing oh-my-zsh"

prompt "Will use stow to symlink: $blue $stowed $white" "stowThings"
confirm "Symlink with stow"

prompt "Will configure ranger shortcuts" "bash ~/dotfiles/scripts/shortcuts/shortcuts"

prompt "Will change button positions on windows" "gsettings set org.gnome.desktop.wm.preferences button-layout 'close,maximize,minimize:'"
confirm "Changed position of window buttons to left side (gnome)"

prompt "Will install s-cli (used in polybar) from npm" "npm install --global @george-aidonidis/s-cli"

thunder
prompt "  Will install: $blue $applications $white" "sudo pacman -S $applications"
confirm "Installing applications"

thunder
prompt "  Will install: $blue bluetooth tools $white" "sudo pacman -S pulseaudio-alsa pulseaudio-bluetooth bluez bluez-libs bluez-utils bluez-firmware blueberry"
confirm "Installing bluetooth tools"

prompt "Adding permissions for current user for docker" "sudo usermod -aG docker ${USER}"
confirm "Procedures docker"

checkMissingPackages
echo " $grn No missing packages were found $white"

prompt "Will install tlp" "sudo pacman -S tlp tlp-rdw acpi_call ethtool smartmontools"
confirm "tlp"
sudo rm /etc/default/tlp
sudo rm /etc/locale.conf
sudo rm /etc/locale.gen
sudo stow -t / etcconfig
sudo stow -t / tlp
sudo systemctl start tlp.service
sudo systemctl enable tlp.service
sudo systemctl enable tlp-sleep.service
sudo systemctl start tlp-sleep.service
sudo systemctl enable fstrim.timer
sudo systemctl mask systemd-rfkill.service
echo "Adding a wallpaper"
./scripts/unsplash-generator

sudo ln -s /etc/fonts/conf.avail/70-no-bitmaps.conf /etc/fonts/conf.d
sudo ln -s /etc/fonts/conf.avail/10-sub-pixel-rgb.conf /etc/fonts/conf.d
sudo ln -s /etc/fonts/conf.avail/11-lcdfilter-default.conf /etc/fonts/conf.d

sudo echo 'export FREETYPE_PROPERTIES="truetype:interpreter-version=40"'

echo "🎉🎉🎉🎉🎉🎉🎉🎉🎉🎉🎉🎉🎉🎉🎉🎉🎉🎉🎉🎉🎉🎉🎉🎉🎉🎉🎉🎉🎉"
echo "Script completed. Please restart for the changes to take effect"
