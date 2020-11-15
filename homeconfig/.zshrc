source "$HOME/dotfiles/zsh/.zshrc"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# source "$(brew --prefix)/etc/profile.d/z.sh"
source "/usr/local/opt/z/etc/profile.d/z.sh"
# eval "$(rbenv init -)"
fpath=($fpath "$HOME/.zfunctions")

export PATH=$PATH
if [[ $TERM == xterm-termite ]]; then
  . /etc/profile.d/vte.sh
  __vte_osc7
fi

# Setting ag as the default source for fzf
# fzf (w/o pipe) will use ag instead of find
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git,node_modules,dist,build,vendor -g ""'
# To apply the command to CTRL-T as well
export UPDATE_ZSH_DAYS=3
# Set nvim as a global editor
export EDITOR='nvim'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export MONITOR='DP-1.8'
export QT_AUTO_SCREEN_SCALE_FACTOR=0
export QT_SCALE_FACTOR=0
export UPDATE_ZSH_DAYS=3
export KEYTIMEOUT=1
export LC_CTYPE='UTF-8'

export PATH="$PATH:$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$HOME/.npm-packages/bin"
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"