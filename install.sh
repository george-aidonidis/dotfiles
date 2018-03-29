#/!bin/bash

## declare an array variable
declare -a arr=("stow" "compton" "dunst" "i3" "nvim" "polybar" "ranger" "redshift" "rofi" "terminator" "tmux" "zsh")

## now loop through the above array
for item in "${arr[@]}"
do
	if ! [ -x "$(command -v $item)" ]; then
		echo "Error: $item is not installed." >&2
		exit 1
	fi
	# or do whatever with individual element of the array
done

echo "Will use stow to symlink:"
echo "- compton"
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
echo "- tmux"

echo "Press Ctrl+C to quit now, or Enter to continue"
read -p ""

stow compton
stow dunst
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
