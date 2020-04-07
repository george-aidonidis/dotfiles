""""""""""""""""""""
" Generic settings "
""""""""""""""""""""
set nocompatible
filetype off
set ic
" Disable safe write
set backupcopy=yes
autocmd Filetype gitcommit setlocal spell textwidth=72
" Search down into subfolders
" Provides tab-completion for all file-related tasks
set path+=**
" Display all matching files when we tab complete
set wildmenu
set wildignore+=**/node_modules/**
set backspace=2   " Backspace deletes like most programs in insert mode

" Disable automatic commenting on newline
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

set undodir=~/.cache/undo  "directory where the undo files will be stored
set undofile                 "turn on the feature

set hidden  " allow buffer switching without saving
