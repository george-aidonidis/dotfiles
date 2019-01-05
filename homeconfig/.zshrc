source "$HOME/dotfiles/zsh/.zshrc"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[[ -r "/usr/share/z/z.sh" ]] && source /usr/share/z/z.sh
fpath=($fpath "$HOME/.zfunctions")

export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator

export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
# Set Spaceship ZSH as a prompt
autoload -U promptinit; promptinit
prompt spaceship


export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export QT_AUTO_SCREEN_SCALE_FACTOR=0
# export XKB_DEFAULT_LAYOUT=us,gr
# export XKB_DEFAULT_VARIANT=,nodeadkeys
# export XKB_DEFAULT_OPTIONS=caps:swapescape,ctrl:swap_lalt_lctl
