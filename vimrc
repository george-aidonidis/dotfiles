" I haven't tweaked vim too much

""""""""""""""""
" Key bindings "
""""""""""""""""
" Map leader key to space
let mapleader = " "
let g:mapleader = " "
nnoremap <F5> :buffers<CR>:buffer<Space>
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
" Pass copied text to clipboard (works on normal)
nnoremap Y "+Y
nnoremap y "+y
nnoremap D "+D
nnoremap d "+d
nnoremap d "+d
" Make buffer modifiable
set ma
" Jump through searches easily
nmap <silent> <DOWN> :cnext<CR>
nmap <silent> <UP> :cprev<CR>
nmap ; :
" bind K to grep word under cursor
nnoremap K :Ag! <cword><CR>
" Close buffer without closing the window
map <leader>q :bp<bar>sp<bar>bn<bar>bd<CR>
" Coding helpers "
ino " ""<left>
ino ' ''<left>
ino ( ()<left>
ino [ []<left>
ino { {}<left>
inoremap [<CR> [<CR>]<C-o>O
inoremap {<CR> {<CR>}<C-o>O

"""""""""""""""""""""
"  Plugin settings  "
"""""""""""""""""""""
""""" Neocomplete """"""
let g:neocomplete#enable_at_startup = 1
" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
      \ 'default' : '',
      \ 'vimshell' : $HOME.'/.vimshell_hist',
      \ 'scheme' : $HOME.'/.gosh_completions'
      \ }
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 2
" Enable omni completion.
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS

""""" Airline """""
" Configure the Tabline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 7
" Enable the patched Powerline fonts
let g:airline_powerline_fonts = 1
let g:airline_theme='base16'
" Just show the filename (no path) in the tab
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'

" Change ale symbol of error
let g:ale_sign_error = '😭'
" Configure js to use eslint
let g:ale_fixers = {
      \  'javascript': ['eslint']
      \}
" Allow jsx in js files
let g:jsx_ext_required = 0
" Open NERDTree automatically when vim starts up
" autocmd vimenter * NERDTree
" Go to previous (last accessed) window.
"autocmd VimEnter * wincmd p
" Close vim if the only window left open is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1
let g:NERDTreeHighlightFolders = 1 " enables folder icon highlighting using exact match
let g:NERDTreeHighlightFoldersFullName = 1 " highlights the folder name

"""""""""""""""""""""""""
"  Plugin key bindings  "
"""""""""""""""""""""""""
" Map ALEFix to a key shortcut
nmap <F8> <Plug>(ale_fix)
" Open path of active file and navigate to right buffer
map <leader><leader> :NERDTreeFind<cr><C-w>l
" Open path of active file
map <leader>n :NERDTreeFind<cr>
" Toggle nerd tree
map <leader>b :NERDTreeToggle<cr>
let NERDTreeShowHidden=1

""""""""""""""""""""""
" Performance options"
""""""""""""""""""""""
set lazyredraw

""""""""""""""""""""
" Generic settings "
""""""""""""""""""""
set nocompatible
filetype off
set ic
" Disable safe write
set backupcopy=yes
set background=dark
autocmd Filetype gitcommit setlocal spell textwidth=72
" Search down into subfolders
" Provides tab-completion for all file-related tasks
set path+=**
" Display all matching files when we tab complete
set wildmenu
set wildignore+=**/node_modules/**
set backspace=2   " Backspace deletes like most programs in insert mode

"""""""""""""""""""""""
" Indentation options "
"""""""""""""""""""""""
" Enable indentation rules that are file-type specific.
filetype plugin indent on
" Indent using 2 spaces.
set tabstop=2
" When shifting, indent using 2 spaces.
set shiftwidth=2
" Convert tabs to spaces.
set expandtab

""""""""""""""""""
" Search options "
""""""""""""""""""
" Highlight query words on search
set hlsearch
" Incremental search that shows partial matches
set incsearch
" Automatically switch search to case-sensitive when search query contains an uppercase letter.
set smartcase
" Show line number on the current line and relative numbers on all other lines.
set relativenumber
" highlight matching [{()}]
set showmatch
let g:ackprg = 'ag --vimgrep'

""""""""""""""""""
" Text rendering "
""""""""""""""""""
" Avoid wrapping a line in the middle of a word.
set linebreak
" Enable line wrapping.
set wrap
" The number of screen lines to keep above and below the cursor.
set scrolloff=3
" The number of screen columns to keep to the left and right of the cursor.
set sidescrolloff=5
" Enable syntax highlighting.
syntax enable
set list listchars=tab:»·,trail:·  " Display extra whitespace characters

""""""""""""""""""""""""
" Code folding options "
""""""""""""""""""""""""
set foldmethod=indent
set foldnestmax=2
set nofoldenable " Disable folding by default.

""""""""""""""""""""""""""
" User Interface options "
""""""""""""""""""""""""""
" Enable mouse for scrolling and resizing
set mouse=a
" Always display the status bar
set laststatus=2
colorscheme gruvbox
" Highlight current line
set cursorline
" Show line numbers
set number
" Open new split panes to right and bottom, which feels more natural {{{2
set splitright
set splitbelow
set showcmd
set encoding=utf8
" Set Vim font to a Nerd Font
" set guifont=Sauce\ Code\ Pro\ Nerd\ Font\ Complete\ 25
set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Plus\ Nerd\ File\ Types\ 21

"""""""""""""""""""""""""
" Miscellaneous Options "
"""""""""""""""""""""""""
" Automatically re-read files if unmodified inside Vim
set autoread
" Treat all numbers as decimal (instead of Vim's default octal! wtf??)
set nrformats=
" Allow per project conf files
set exrc
" Disable unsafe commands in project-specific settings
set secure
" set completeopt=longest,menuone
" Disable swap files
set noswapfile
" Enable spellchecking
set spell
" Set visual bell {not working in gnome terminal :'( }. Also disable sound
" bells
"set visualbell
" Automatically :write before running commands
set autowrite
" Hide history when switching to other buffers
set hidden

""""""""""""""""""
"Custom Commands "
""""""""""""""""""
command TrimWhiteSpace call TrimWhiteSpace()
" Quit from current buffer and move to previous one (does not close active window)
command Bd bp\|bd \#
if has("autocmd")
  filetype plugin indent on

  " Automatically clean trailing whitespace
  autocmd BufWritePre * call TrimWhiteSpace()
endif
"""""""""""""
" Functions "
"""""""""""""
fun! TrimWhiteSpace()
  let l:save = winsaveview()
  %s/\s\+$//e
  call winrestview(l:save)
endfun
