source $HOME/.tokens
export PATH=$PATH$HOME/bin:/usr/local/bin
source $HOME/dotfiles/homeconfig/.bash_shortcuts

export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="geoffgarside"
plugins=(git vi-mode)
# direnv hook into the shell
eval "$(direnv hook zsh)"

# https://stackoverflow.com/questions/815686/unable-to-make-a-backward-tab-as-shift-tab-in-zsh
bindkey '^[[Z' reverse-menu-complete

source $HOME/dotfiles/zsh/aliases.sh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

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
export SPACESHIP_CHAR_SYMBOL='🥦🐑💨🐣 '
export SPACESHIP_PROMPT_PREFIXES_SHOW=false

SPACESHIP_PROMPT_ORDER=(
	time
	user
	dir
	host
	git
	package
	node
	docker
	line_sep
	vi_mode
	jobs
	exit_code
	char
)

source $HOME/.oh-my-zsh/oh-my-zsh.sh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-you-should-use/you-should-use.plugin.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh
