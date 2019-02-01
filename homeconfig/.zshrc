source "$HOME/dotfiles/zsh/.zshrc"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[[ -r "/usr/share/z/z.sh" ]] && source /usr/share/z/z.sh
fpath=($fpath "$HOME/.zfunctions")

export PATH=$PATH
# Set Spaceship ZSH as a prompt
autoload -U promptinit; promptinit
prompt spaceship

export PATH="$PATH:$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$HOME/.npm-packages/bin"

export QT_AUTO_SCREEN_SCALE_FACTOR=0
export QT_SCALE_FACTOR=0
export UPDATE_ZSH_DAYS=3
export KEYTIMEOUT=1
# export XKB_DEFAULT_LAYOUT=us,gr
# export XKB_DEFAULT_VARIANT=,nodeadkeys
# export XKB_DEFAULT_OPTIONS=caps:swapescape,ctrl:swap_lalt_lctl
