export ZSH_DISABLE_COMPFIX=true
source $HOME/.tokens
export PATH=$PATH$HOME/bin:/usr/local/bin:$HOME/.local/bin
# export PATH=$PATH$HOME/bin:/usr/local/bin:$HOME/.local/bin:/Applications/Docker.app/Contents/Resources/bin/
# Homebrew sbin
export PATH="/usr/local/sbin:$PATH"

# direnv hook into the shell
eval "$(direnv hook zsh)"

# https://stackoverflow.com/questions/815686/unable-to-make-a-backward-tab-as-shift-tab-in-zsh
bindkey '^[[Z' reverse-menu-complete

# Fix for arrow-key searching
# start typing + [Up-Arrow] - fuzzy find history forward
if [[ "${terminfo[kcuu1]}" != "" ]]; then
  autoload -U up-line-or-beginning-search
  zle -N up-line-or-beginning-search
  bindkey "${terminfo[kcuu1]}" up-line-or-beginning-search
fi
# start typing + [Down-Arrow] - fuzzy find history backward
if [[ "${terminfo[kcud1]}" != "" ]]; then
  autoload -U down-line-or-beginning-search
  zle -N down-line-or-beginning-search
  bindkey "${terminfo[kcud1]}" down-line-or-beginning-search
fi

# Disable flow control for that terminal completely
stty -ixon

source $HOME/dotfiles/zsh/aliases.sh

# The next line updates PATH for the Google Cloud SDK.
# source /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc

# The next line enables zsh completion for gcloud.
# source /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc
eval "$(starship init zsh)"
# zvm_after_init_commands+=('[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh')