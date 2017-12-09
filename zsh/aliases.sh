# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

#######
# Git #
#######
alias "gcob=git checkout -b"
alias "gfp=git fetch --prune"
alias "xc=xclip"
# Copy selection to clipboard xcc < "example"
alias "xcc=xclip -selection clipboard"
# Paste
alias "xv=xclip -o"

alias "delete-swap=find ./ -type f -name \"\.*sw[klmnop]\" -delete"
alias "tmux-dev= tmux split-window -h -p 70 \; split-window -p 18"
alias "e=ranger"
alias "npm-show-global=npm list -g --depth=0"

# Feed the output of ag into fzf
#ag -g "" | fzf
# Global ignore for the silver searcher
alias ag='ag --path-to-ignore ~/dotfiles/.ignore'
