if !exists('g:vscode')
  let g:enable_whichkey = isdirectory($HOME.'/.config/nvim/plugged/vim-which-key')
endif


" Map leader key to space
let g:mapleader = " "
let g:maplocalleader = ','
if !exists('g:vscode')
  let g:which_key_map =  { 'name' : 'Leader'}
endif

if !exists('g:vscode')
  if g:enable_whichkey
    function! InitWhickey()
      call which_key#register('<Space>', "g:which_key_map")

      nnoremap <silent> <leader> :<c-u>WhichKey '<Space>'<CR>
      vnoremap <silent> <leader> :<c-u>WhichKeyVisual '<Space>'<CR>
    endfunction
    call InitWhickey()
  endif
endif

function! s:load_default() abort
  nmap <leader>r :so ~/.config/nvim/init.vim<CR>

  if g:enable_whichkey
    let g:which_key_map.r = 'Reload neovim configuration'
  endif
endfunction

function! s:load_plug() abort
  nmap <leader>r :so ~/.config/nvim/init.vim<CR>
  nnoremap <silent> <Leader>vU  :PlugUpgrade<CR>
  nnoremap <silent> <Leader>vu  :PlugUpdate<CR>
  nnoremap <silent> <Leader>vi  :PlugInstall<CR>
  nnoremap <silent> <Leader>vc  :PlugClean<CR>

  if g:enable_whichkey
    let g:which_key_map.v = { 'name': '+Vim Plug'}
    let g:which_key_map.v.U = 'Vim plug Upgrade'
    let g:which_key_map.v.u = 'Update all plugins'
    let g:which_key_map.v.i = 'Vim plug Install'
    let g:which_key_map.v.c = 'Vim plug Clean'
  endif
endfunction

function! s:load_windows() abort
  " Navigate to active panes more easily
  nnoremap <C-h> <C-w>h
  nnoremap <C-j> <C-w>j
  nnoremap <C-k> <C-w>k
  nnoremap <C-l> <C-w>l
  nnoremap <Leader>H :vertical resize +10<CR>
  nnoremap <Leader>J :resize +10<CR>
  nnoremap <Leader>K :resize -10<CR>
  nnoremap <Leader>L :vertical resize -10<CR>
  if g:enable_whichkey
    let g:which_key_map.H = 'Resize left +10'
    let g:which_key_map.J = 'Resize down +10'
    let g:which_key_map.K = 'Resize top +10'
    let g:which_key_map.L = 'Resize right +10'
  endif
endfunction

if !exists('g:vscode')
  call s:load_default()
  call s:load_plug()
  call s:load_windows()
endif

""""""""""""""""
" Key bindings "
""""""""""""""""
" Easily navigate up/down on text in the same line
nnoremap j gj
nnoremap k gk
nnoremap k gk
"###########################
"      Buffers & Tabs      #
"###########################
" Disable highlight until next search
nnoremap <esc> :noh<CR><CR>

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
" map ; :
" noremap ;; ;
" Coding helpers "
" inoremap [<CR> [<CR>]<C-o>O
" inoremap {<CR> {<CR>}<C-o>O
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
