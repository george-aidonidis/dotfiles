source ~/.profile
export EDITOR=/usr/bin/nvim
export PATH="$PATH:$(du "$HOME/dotfiles/scripts/" | cut -f2 | tr '\n' ':')"
