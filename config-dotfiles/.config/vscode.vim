call plug#begin()
Plug 'machakann/vim-sandwich'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-projectionist'
Plug 'christoomey/vim-system-copy'
call plug#end()

xmap gc  <Plug>VSCodeCommentary
nmap gc  <Plug>VSCodeCommentary
omap gc  <Plug>VSCodeCommentary
nmap gcc <Plug>VSCodeCommentaryLine

""""""""""""""""
" Key bindings "
""""""""""""""""
" Map leader key to space
let mapleader = " "
let g:mapleader = " "
" Disable highlight until next search

nnoremap <Leader>gh :call VSCodeCall("openInGithub.copyInGitHubFile")

nnoremap <esc> :noh<CR>
