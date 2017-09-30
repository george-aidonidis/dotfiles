" I haven't tweaked vim too much

call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-fugitive'
Plug 'rstacruz/sparkup', {'rtp': 'vim/'}
Plug 'morhetz/gruvbox'
Plug 'chriskempson/base16-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'w0rp/ale'
Plug 'airblade/vim-gitgutter'
Plug 'editorconfig/editorconfig-vim'
Plug 'pangloss/vim-javascript'
Plug 'tpope/vim-surround'
Plug 'mxw/vim-jsx'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'mattn/emmet-vim'
call plug#end()

"""""""""""""""""""""
"  Plugin settings  "
"""""""""""""""""""""
" Map ALEFix to a key shortcut
nmap <F8> <Plug>(ale_fix)
" Change ale symbol of error
let g:ale_sign_error = '😵'
" Configure js to use eslint
let g:ale_fixers = {
      \  'javascript': ['eslint']
      \}
let g:airline_theme='base16'
" Just show the filename (no path) in the tab
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'
" Allow jsx in js files
let g:jsx_ext_required = 0
" Open NERDTree automatically when vim starts up
autocmd vimenter * NERDTree
" Go to previous (last accessed) window.
autocmd VimEnter * wincmd p
" Close vim if the only window left open is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Open path of active file and navigate to right buffer
map <leader>\ :NERDTreeFind<cr><C-w>l
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

""""""""""""""""""
" Text rendering "
""""""""""""""""""
" Avoid wrapping a line in the middle of a word.
set linebreak
" Enable line wrapping.
set wrap
" The number of screen lines to keep above and below the cursor.
set scrolloff=1
" The number of screen columns to keep to the left and right of the cursor.
set sidescrolloff=5
" Enable syntax highlighting.
syntax enable

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
" Make vsplit put the new buffer on the right of the current buffer
set splitright
" Make split put the new buffer below the current buffer:
set splitbelow

""""""""""""""""
" Key bindings "
""""""""""""""""
" Disable highlight until next search
nnoremap <silent><leader>c :let @/ = ""<CR>
nnoremap <leader>g :Ag<CR>
nnoremap <leader>f :Files<CR>
" Pass copied text to clipboard (works on normal and visual mode)
nnoremap Y "+Y
nnoremap y "+y
vnoremap p "+p
vnoremap P "+P
nnoremap D "+D
nnoremap d "+d
" Make buffer modifiable
set ma

"""""""""""""""""""""""""
" Miscallaneous Options "
"""""""""""""""""""""""""
" Treat all numbers as decimal (instead of Vim's default octal! wtf??)
set nrformats=
" Allow per project conf files
set exrc
" Disable unsafe commands in project-specific settings
set secure
" set completeopt=longest,menuone
" Disable swap files
set noswapfile

""""""""""""""""""
"Custom Commands "
""""""""""""""""""
command TrimWhiteSpace call TrimWhiteSpace()
" Quit from current buffer and move to previous one (does not close active window)
command Bd bp\|bd \#

"""""""""""""
" Functions "
"""""""""""""
fun! TrimWhiteSpace()
  lEt l:save = winsaveview()
  %s/\s\+$//e
  call winrestview(l:save)
endfun
