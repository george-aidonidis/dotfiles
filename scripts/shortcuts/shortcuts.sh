#!/bin/bash

# Config locations
folders="$HOME/dotfiles/scripts/shortcuts/folders"
configs="$HOME/dotfiles/scripts/shortcuts/configs"

# Output locations
bash_shortcuts="$HOME/dotfiles/homeconfig/.bash_shortcuts"
ranger_shortcuts="$HOME/dotfiles/ranger/.config/ranger/shortcuts.conf"

# Ensuring that output locations are properly sourced
(cat $HOME/dotfiles/zsh/.zshrc | grep "source $HOME/dotfiles/homeconfig/.bash_shortcuts")>/dev/null || echo "source $HOME/dotfiles/homeconfig/.bash_shortcuts" >> $HOME/dotfiles/zsh/.zshrc
(cat $HOME/dotfiles/ranger/.config/ranger/rc.conf | grep "source $HOME/dotfiles/ranger/.config/ranger/shortcuts.conf")>/dev/null || echo "source $HOME/dotfiles/ranger/.config/ranger/shortcuts.conf" >> $HOME/dotfiles/ranger/.config/ranger/rc.conf

#Delete old shortcuts
echo "# nvim: filetype=sh" > $bash_shortcuts
echo "# ranger shortcuts" > $ranger_shortcuts

writeDirs() { echo "alias $1='cd $2 && ls -a'" >> $bash_shortcuts
	echo "map g$1 cd $2" >> $ranger_shortcuts
	echo "map t$1 tab_new $2" >> $ranger_shortcuts
	echo "map m$1 shell mv -v %s $2" >> $ranger_shortcuts
	echo "map Y$1 shell cp -rv %s $2" >> $ranger_shortcuts ;}

writeConfs() {
	echo "alias $1='nvim $2'" >> $bash_shortcuts
	echo "map $1 shell nvim $2" >> $ranger_shortcuts ;}

IFS=$'\n'
set -f
for line in $(cat "$folders"); do
	line=$(echo $line | sed 's/#.*//')
	key=$(echo $line | awk '{print $1}')
	dir=$(echo $line | awk '{print $2}')
	[ "$dir" == "" ] || writeDirs $key $dir
done

set -f
for line in $(cat "$configs");
do
	line=$(echo $line | sed 's/#.*//')
	short=$(echo $line | awk '{print $1}')
	conf=$(echo $line | awk '{print $2}')
	[ "$conf" == "" ] || writeConfs $short $conf
done
