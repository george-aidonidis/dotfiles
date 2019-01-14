export EDITOR=/usr/bin/nvim
export BROWSER=/usr/bin/google-chrome-stable
export PATH="$PATH:$(du "$HOME/dotfiles/scripts/" | cut -f2 | tr '\n' ':')"


if [[ "$(tty)" = "/dev/tty1" ]]; then
	pgrep -x i3 || exec startx
fi
