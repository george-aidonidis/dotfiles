export EDITOR=/usr/bin/nvim
export BROWSER=/usr/bin/google-chrome-stable
export PATH="$PATH:$(du "$HOME/dotfiles/scripts/" | cut -f2 | tr '\n' ':')"
