if [ -n "$DESKTOP_SESSION" ];then
    eval $(gnome-keyring-daemon --start)
    export SSH_AUTH_SOCK
fi

export EDITOR=/usr/bin/nvim
export BROWSER=/usr/bin/firefox-developer-edition
export SECONDARYBROWSER=/usr/bin/google-chrome-stable
export PATH="$PATH:$(du "$HOME/dotfiles/scripts/" | cut -f2 | tr '\n' ':')"
