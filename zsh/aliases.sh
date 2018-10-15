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
alias "sp=sudo pacman"
alias "spr=sudo pacman -Rsn"
alias "sps=sudo pacman -S"
alias "p=pacman"
# Dry run
alias "pcheck=sudo paccache -d"
# Actually run the command
alias "pclean=sudo paccache -r"

#######
# Git #
#######
alias "gcob=git checkout -b"
alias "gfp=git fetch --prune"
alias "gla=git pull --all"
# Remove every local branch except master
# git delete expect master branch
alias "gdema=git branch | grep -v 'master' | xargs git branch -D"
# Remove all merged branches
# git delete merged
alias "gdme=git branch --merged | grep -v \* | xargs git branch -D"

#######
# Yarn #
#######
alias yi="yarn install"
alias yr="yarn run"
alias ya="yarn add"
alias yad="yarn add --dev "
alias yag="yarn global add"
#
#######
# NPM #
#######
alias nr="npm run "
alias ni="npm install "
alias nis="npm install --save "
alias nid="npm install --save-dev "

########
# Arch #
########
alias update="sudo pacman --noconfirm -Syu && yay -Syu --aur --noconfirm"

##########
# Docker #
#########
alias docker-delete-containers="docker rm \$(docker ps -a -q)"
alias docker-delete-images="docker rmi \$(docker images -a -q) -f"
alias docker-stop-all="docker stop \$(docker ps -a -q)"

########
# Misc #
########
# Make and enter inside a directory
# mkdir -p test && cd test ➡️ mkcd test
alias mkcd='foo(){ mkdir -p "$1"; cd "$1" }; foo '

# Show my ip address
alias myip="curl http://ipecho.net/plain; echo"

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

transfer() {
  tmpfile=$(mktemp -t transferXXX);
  curl --progress-bar --upload-file $1 https://transfer.sh/$(basename $1) >> $tmpfile;
  cat $tmpfile;
  rm -f $tmpfile;
};

alias "nowwork=now --token ${NOW_WORK_TOKEN}"
alias "nowpersonal=now --token ${NOW_PERSONAL_TOKEN}"
alias "nowmarge=now --token ${NOW_MARGE_TOKEN}"
