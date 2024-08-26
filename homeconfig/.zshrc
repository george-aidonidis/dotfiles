source "$HOME/dotfiles/zsh/.zshrc"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source "$(brew --prefix)/etc/profile.d/z.sh"
fpath=($fpath "$HOME/.zfunctions")

export PATH=$PATH

# Setting ag as the default source for fzf
# fzf (w/o pipe) will use ag instead of find
# To apply the command to CTRL-T as well
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git,node_modules,dist,build,vendor -g ""'
export UPDATE_ZSH_DAYS=3
# Set nvim as a global editor
export EDITOR='nvim'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export UPDATE_ZSH_DAYS=3
export KEYTIMEOUT=1
export LC_CTYPE='UTF-8'

export PATH="$PATH:$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$HOME/.npm-packages/bin"
export PATH="$HOME/tools/lua-language-server/bin/macOS:$PATH"
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
setopt auto_cd

rbenv() {
  eval "$(command rbenv init -)"
  rbenv "$@"
}

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

source $HOME/dotfiles/zsh/.zinit