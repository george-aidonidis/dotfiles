# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
GREEN="$(tput setaf 2)"
BLUE="$(tput setaf 4)"
NORMAL="$(tput sgr0)"

########
# Arch #
########
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
alias "gcom=git checkout master"
alias "gcob=git checkout -b"
alias "gfp=git fetch --prune"
alias "gla=git pull --all"
alias "glr=git pull --rebase"
# Remove every local branch except master
# git delete expect master branch
alias "gdema=git branch | grep -v 'master' | xargs git branch -D"
# Remove all merged branches
# git delete merged
alias "gdme=git branch --merged | grep -v \* | xargs git branch -D"

gclw() {
  if [ -z $1 ]
  then
    echo "No repository entered"
  else
   project=`echo $1 | sed -e 's/git@github.com:toptal\///' -e 's/\.git$//'`
    git clone $1
    cd $project
    git config user.email "george.aidonidis@toptal.com"
  fi
};

#######
# Yarn #
#######
alias y="yarn"
alias ygl0="yarn global list --depth=0"
alias yi="yarn install"
alias yr="yarn run"
alias ya="yarn add"
alias yad="yarn add --dev "
alias yaga="yarn global add"
alias yagr="yarn global remove"
alias yarn_global_upgrade="yarn global upgrade --latest"
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
update() {
  upgrade_oh_my_zsh
  printf '%s' "$BLUE"
  printf '%s\n' ' _ __   __ _  ___ _ __ ___   __ _ _ __  '
  printf '%s\n' '|  _ \ / _` |/ __|  _ ` _ \ / _` |  _ \ '
  printf '%s\n' '| |_) | (_| | (__| | | | | | (_| | | | |'
  printf '%s\n' '| .__/ \__,_|\___|_| |_| |_|\__,_|_| |_|'
  printf '%s\n' '|_|                                     '
  printf '%s' "$NORMAL"
  sudo pacman --noconfirm -Syu
  printf '%s' "$BLUE"
  printf '%s\n' '  _   _  __ _ _   _'
  printf '%s\n' ' | | | |/ _` | | | |'
  printf '%s\n' ' | |_| | (_| | |_| |'
  printf '%s\n' '  \__, |\__,_|\__, |'
  printf '%s\n' '  |___/       |___/'
  yay -Syu --aur --noconfirm
}

########
# Bios #
########
alias bios-refresh="sudo fwupdmgr refresh"
alias bios-get-updates="sudo fwupdmgr get-updates"
alias bios-update="sudo fwupdmgr update"

##########
# Docker #
#########
alias docker-delete-containers="docker rm \$(docker ps -a -q)"
alias docker-delete-images="docker rmi \$(docker images -a -q) -f"
alias docker-stop-all="docker stop \$(docker ps -a -q)"

##########
# System #
##########
alias charge-full-bat0="sudo tlp fullcharge BAT0"
alias charge-full-bat1="sudo tlp fullcharge BAT1"

alias discharge-bat0="sudo tlp discharge BAT0"
alias discharge-bat1="sudo tlp discharge BAT1"
########
# Misc #
########
alias "ls=lsd"
alias "n=nvim"
# Make and enter inside a directory
# mkdir -p test && cd test --->➡️ mkcd test
alias mkcd='foo(){ mkdir -p "$1"; cd "$1" }; foo '

# Show my ip address
alias myip="curl http://ipecho.net/plain; echo"

alias "xc=xclip"
# Copy selection to clipboard xcc < "example"
alias "xcc=xclip -selection clipboard"
# Paste
alias "xv=xclip -o"

# Sudo edit
alias "sn=sudo -E nvim"

alias "tmux-dev= tmux split-window -h -p 70 \; split-window -p 18"
alias "e=ranger"
alias "npm-show-global=npm list -g --depth=0"

# Feed the output of ag into fzf
#ag -g "" | fzf
# Global ignore for the silver searcher
alias ag='ag --path-to-ignore ~/dotfiles/.ignore'

function tmux() {
  emulate -L zsh

  # Make sure even pre-existing tmux sessions use the latest SSH_AUTH_SOCK.
  # (Inspired by: https://gist.github.com/lann/6771001)
  local SOCK_SYMLINK=~/.ssh/ssh_auth_sock
  if [ -r "$SSH_AUTH_SOCK" -a ! -L "$SSH_AUTH_SOCK" ]; then
    ln -sf "$SSH_AUTH_SOCK" $SOCK_SYMLINK
  fi

  # If provided with args, pass them through.
  if [[ -n "$@" ]]; then
    env SSH_AUTH_SOCK=$SOCK_SYMLINK tmux "$@"
    return
  fi

  # Check for .tmux file (poor man's Tmuxinator).
  if [ -x .tmux ]; then
    # Prompt the first time we see a given .tmux file before running it.
    local DIGEST="$(openssl sha512 .tmux)"
    if ! grep -q "$DIGEST" ~/..tmux.digests 2> /dev/null; then
      cat .tmux
      read -k 1 -r \
        'REPLY?Trust (and run) this .tmux file? (t = trust, otherwise = skip) '
      echo
      if [[ $REPLY =~ ^[Tt]$ ]]; then
        echo "$DIGEST" >> ~/..tmux.digests
        ./.tmux
        return
      fi
    else
      ./.tmux
      return
    fi
  fi

  # Attach to existing session, or create one, based on current directory.
  local SESSION_NAME=$(basename "${$(pwd)//[.:]/_}")
  env SSH_AUTH_SOCK=$SOCK_SYMLINK tmux new -A -s "$SESSION_NAME"
}

transfer() {
  tmpfile=$(mktemp -t transferXXX);
  curl --progress-bar --upload-file $1 https://transfer.sh/$(basename $1) >> $tmpfile;
  cat $tmpfile;
  rm -f $tmpfile;
};

alias "nowwork=now --token ${NOW_WORK_TOKEN}"
alias "nowpersonal=now --token ${NOW_PERSONAL_TOKEN}"
alias "nowmarge=now --token ${NOW_MARGE_TOKEN}"
