""""""""""""""""""""""""""
" User Interface options "
""""""""""""""""""""""""""
" Enable mouse for scrolling and resizing
set mouse=a
" Always display the status bar
set laststatus=2

au ColorScheme * hi Normal ctermbg=None
let g:tokyonight_style = "night"
colorscheme tokyonight

set termguicolors
syntax enable
syntax on
" Highlight current line
set cursorline
" Show line numbers
set number
" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright
set showcmd
set encoding=utf8
" Set Vim font to a Nerd Font
" set guifont=Source\ Code\ Pro\ Light:h21
set guifont=Sauce\ Code\ Pro\ Nerd\ Font\ Complete\ 13
" set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Plus\ Nerd\ File\ Types\ 21
"
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar

set showtabline=2  " always show tabline
set noshowmode

