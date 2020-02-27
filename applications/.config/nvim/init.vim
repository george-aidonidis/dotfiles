" Install Vim Plug if not installed
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.config/nvim/plugged')
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-sensible'

Plug 'jiangmiao/auto-pairs'
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'mgee/lightline-bufferline'
Plug 'christoomey/vim-sort-motion'
Plug 'rakr/vim-one'
Plug 'itchyny/lightline.vim'
Plug 'christoomey/vim-system-copy'
Plug 'airblade/vim-gitgutter'
Plug 'editorconfig/editorconfig-vim'
Plug 'mattn/emmet-vim'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'sheerun/vim-polyglot'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'

Plug 'yuki-ycino/fzf-preview.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'bogado/file-line'
call plug#end()

"""""""""""""""""""""""
" Performance options "
"""""""""""""""""""""""
set lazyredraw

so ~/dotfiles/applications/.config/nvim/custom/key-bindings.vim
so ~/dotfiles/applications/.config/nvim/custom/search.vim
so ~/dotfiles/applications/.config/nvim/custom/text-render.vim
so ~/dotfiles/applications/.config/nvim/custom/indent.vim
so ~/dotfiles/applications/.config/nvim/custom/folding.vim
so ~/dotfiles/applications/.config/nvim/custom/misc.vim
so ~/dotfiles/applications/.config/nvim/custom/commands.vim
so ~/dotfiles/applications/.config/nvim/custom/user-interface.vim

let g:neosnippet#enable_completed_snippet = 1
autocmd BufWritePost ~/dotfiles/homeconfig/.bm* !shortcuts
