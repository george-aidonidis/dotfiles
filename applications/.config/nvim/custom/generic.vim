""""""""""""""""""""
" Generic settings "
""""""""""""""""""""
filetype off
set ic
" Disable safe write
set backupcopy=yes
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

""""""""""""""""""""
" Git settings "
""""""""""""""""""""
autocmd FileType gitcommit setlocal textwidth=72
autocmd FileType gitcommit set colorcolumn=73


