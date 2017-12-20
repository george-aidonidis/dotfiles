""""""""""""""""
" Key bindings "
""""""""""""""""
" Map leader key to space
let mapleader = " "
let g:mapleader = " "
" Easily navigate up/down on text in the same line
nnoremap j gj
nnoremap k gk
" Show all buffers
nnoremap <F5> :buffers<CR>:buffer<Space>
" remap arrow keys
nnoremap <Left> :bprevious<CR>
nnoremap <Right> :bnext<CR>
nnoremap <C-n> :bnext<CR>
nnoremap <C-p> :bprevious<CR>
" Navigate to active panes more easily
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" Split tab vertically
nnoremap <leader>v <C-w>v
" Split tab horizontally
nnoremap <leader>s <C-w>s
" Disable highlight until next search
nnoremap <silent><leader>c :let @/ = ""<CR>
nnoremap <leader>g :Ag<CR>
nnoremap <leader>f :Files<CR>
" Pass copied text to clipboard (works on normal and visual mode)
"nnoremap Y "+Y
"nnoremap y "+y
"vnoremap y "+y
"nnoremap D "+D
"nnoremap d "+d
"vnoremap d "+d
" Make buffer modifiable
set ma
" Jump through searches easily
nmap <silent> <DOWN> :cnext<CR>
nmap <silent> <UP> :cprev<CR>
map ; :
noremap ;; ;
" bind K to grep word under cursor
nnoremap K :Ag! <cword><CR>
" Close buffer without closing the window
map <leader>q :bp<bar>sp<bar>bn<bar>bd<CR>
" Coding helpers "
inoremap [<CR> [<CR>]<C-o>O
inoremap {<CR> {<CR>}<C-o>O
" Javascript
inoremap <leader>clr console.dir();<esc>F(a
inoremap <leader>clg console.log();<esc>F(a
inoremap <leader>cls console.log(JSON.stringify(, null, 2));<esc>F(a
vnoremap <leader>clr dOconsole.dir(<esc>pA);<esc>$
vnoremap <leader>clg dOconsole.log(<esc>pA);<esc>$
vnoremap <leader>cls dOconsole.log(JSON.stringify(<esc>pA));<esc>$
set runtimepath+=~/.fzf

" Esc allows to exit `insert` mode on terminal
tnoremap <Esc> <C-\><C-n>


