" I haven't tweaked vim too much

set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'morhetz/gruvbox'
Plugin 'chriskempson/base16-vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'w0rp/ale'
Plugin 'airblade/vim-gitgutter'
let g:airline_theme='base16'
call vundle#end()

set hlsearch
set incsearch
set number
set showmatch
highlight Comment ctermfg=LightCyan
set wrap
syntax on
set background=dark
autocmd Filetype gitcommit setlocal spell textwidth=72
filetype plugin indent on
set tabstop=2
set shiftwidth=2
set expandtab
" Search down into subfolders
" Provides tab-completion for all file-related tasks
set path+=**
" Display all matching files when we tab complete
set wildmenu

set wildignore+=**/node_modules/**
set laststatus=2
colorscheme gruvbox
