""""""""""""""""
" Key bindings "
""""""""""""""""
" Map leader key to space
let mapleader = " "
let g:mapleader = " "
" Easily navigate up/down on text in the same line
nnoremap j gj
nnoremap k gk
nnoremap k gk
nmap <leader>r :so ~/.config/nvim/init.vim<CR>
"###########################
"      Buffers & Tabs      #
"###########################
" Show all buffers
nnoremap <F5> :buffers<CR>:buffer<Space>
nnoremap <C-PAGEDOWN> :bnext<CR>
nnoremap <C-PAGEUP> :bprevious<CR>
" Close buffer without closing the window
map <leader>q :bp<bar>sp<bar>bn<bar>bd<CR>

nnoremap <A-h> :vertical resize +5<CR>
nnoremap <A-j> :resize +5<CR>
nnoremap <A-k> :resize -5<CR>
nnoremap <A-l> :vertical resize -5<CR>

" Navigate to active panes more easily
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" Disable highlight until next search
nnoremap <esc> :noh<CR><CR>
nnoremap <leader>9 :FzfPreviewGitStatus<CR>
nnoremap <leader>p :FzfPreviewBuffers<CR>
nnoremap <C-p> :FzfPreviewProjectFiles<CR>
" Find word (fw) under cursor
nmap <leader>fw <Plug>CtrlSFCwordPath<CR>
" Match word (fW) under cursor
nmap <leader>fW <Plug>CtrlSFCwordPath -W<CR>
" Find generic -> fg
nmap <leader>fg <Plug>CtrlSFPrompt -hidden<space>

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

" Map save to Ctrl-S
noremap <silent> <C-S> :update<CR>
vnoremap <silent> <C-S> <C-C>:update<CR>
inoremap <silent> <C-S> <C-O>:update<CR>
