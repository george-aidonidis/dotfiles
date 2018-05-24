#/!bin/bash

red=$'\e[1;31m'
grn=$'\e[1;32m'
blu=$'\e[1;34m'
mag=$'\e[1;35m'
cyn=$'\e[1;36m'
white=$'\e[0m'
yellow=$'\e[0;33m'

mkdir -p /home/$USER/tmp/
yaourt -s --noconfirm zsh-autosuggestions
## declare an array variable
declare -a arr=("stow" "compton" "dunst" "i3" "nvim" "polybar" "ranger" "redshift" "rofi" "terminator" "tmux" "zsh")

## now loop through the above array
for item in "${arr[@]}"
do
	if ! [ -x "$(command -v $item)" ]; then
		echo "$red  Error: $item is not installed.$white" >&2
		exit 1
	fi
	# or do whatever with individual element of the array
done

echo "Will use stow to symlink:"
echo "$grn- compton"
echo "- dunst"
echo "- i3"
echo "- idea"
echo "- mimeapps"
echo "- nvim"
echo "- polybar"
echo "- ranger"
echo "- redshift"
echo "- rofi"
echo "- terminator"
echo "- tmux$white"

printf "\nPress$red Ctrl+C$white to quit now, or$blu Enter$white to continue"
read -p ""

# TODO: check if one of the folders bellow already exists
stow compton
stow dunst
stow gtk-3.0
stow i3
stow idea
stow mimeapps
stow nvim
stow polybar
stow ranger
stow redshift
stow rofi
stow terminator
stow tmux

echo "$grn $white Symlinked folders with stow"

gsettings set  org.gnome.desktop.wm.preferences button-layout 'close,maximize,minimize:'
echo "$grn $white Changed position of window buttons to left side (gnome)"

echo "$yellow$white"
echo "  Installing tmux plugin manager"

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

sudo pacman -S tmux rofi compton neovim redshift dunst terminator gpicview jq peek feh maim xclip arandr w3m the_silver_searcher lxappearance playerctl dialog xcursor-breeze mplayer ttf-droid awesome-terminal-fonts ruby atom parcellite messengerfordesktop docker docker-compose mongodb papirus-icon-theme

sudo pacman -S pulseaudio-alsa pulseaudio-bluetooth bluez bluez-libs bluez-utils bluez-firmware blueberry

yaourt --noconfirm -S polybar betterlockscreen-git insomnia ngrok pgweb-bin robo3t-bin light-git xkb-switch lightdm-webkit-theme-litarvan visual-studio-code-bin direnv ttf-weather-icons slack-desktop spotify

sudo mkdir -p /data/db
sudo chown -R $USER /data/db
sudo usermod -aG docker ${USER}
