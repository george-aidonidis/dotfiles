""""""""""""""""""
" Search options "
""""""""""""""""""
" Highlight query words on search
set hlsearch
" Incremental search that shows partial matches
set incsearch
" Automatically switch search to case-sensitive when search query contains
" an uppercase letter.
set ignorecase
" highlight matching [{()}]
set showmatch
let g:ackprg = 'ag --vimgrep'

