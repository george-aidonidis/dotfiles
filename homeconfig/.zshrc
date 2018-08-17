source /home/george/dotfiles/zsh/.zshrc

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
fpath=($fpath "$HOME/.zfunctions")

# Set Spaceship ZSH as a prompt
autoload -U promptinit; promptinit
prompt spaceship
