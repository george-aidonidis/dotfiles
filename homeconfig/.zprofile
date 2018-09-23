EDITOR=/usr/bin/nvim
BROWSER=/usr/bin/google-chrome-stable

if [[ "$(tty)" = "/dev/tty1" ]]; then
	pgrep -x i3 || exec startx
fi
