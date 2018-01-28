call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'taohex/lightline-buffer'
Plug 'rstacruz/sparkup', {'rtp': 'vim/'}
Plug 'morhetz/gruvbox'
Plug 'itchyny/lightline.vim'
" Javascript
Plug 'Shougo/deoplete.nvim', { 'do': 'UpdateRemotePlugins' }
Plug 'ternjs/tern_for_vim', { 'do': 'npm install && npm install -g tern' }
Plug 'carlitux/deoplete-ternjs'

Plug 'christoomey/vim-system-copy'
Plug 'w0rp/ale'
Plug 'airblade/vim-gitgutter'
Plug 'editorconfig/editorconfig-vim'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
call plug#end()

""""""""""""""""""""""
" Performance options"
""""""""""""""""""""""
set lazyredraw

so ~/dotfiles/nvim/.config/nvim/custom/key-bindings.vim
so ~/dotfiles/nvim/.config/nvim/custom/search.vim
so ~/dotfiles/nvim/.config/nvim/custom/indent.vim
so ~/dotfiles/nvim/.config/nvim/custom/text-render.vim
so ~/dotfiles/nvim/.config/nvim/custom/folding.vim
so ~/dotfiles/nvim/.config/nvim/custom/user-interface.vim
so ~/dotfiles/nvim/.config/nvim/custom/misc.vim
so ~/dotfiles/nvim/.config/nvim/custom/commands.vim
