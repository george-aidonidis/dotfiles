if [ -n "$DESKTOP_SESSION" ];then
    eval $(gnome-keyring-daemon --start)
    export SSH_AUTH_SOCK
fi

export EDITOR=/usr/bin/nvim
export MAINBROWSER=/usr/bin/firefox
export SECONDARYBROWSER=/usr/bin/google-chrome-stable
export PATH="$PATH:$(du "$HOME/dotfiles/scripts/" | cut -f2 | tr '\n' ':')"
