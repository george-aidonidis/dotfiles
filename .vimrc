" I haven't tweaked vim too much

call plug#begin('~/.vim/plugged')
" Search down into subfolders
Plug 'tpope/vim-fugitive'
Plug 'rstacruz/sparkup', {'rtp': 'vim/'}
Plug 'morhetz/gruvbox'
Plug 'chriskempson/base16-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline_theme='base16'
" Just show the filename (no path) in the tab
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'
Plug 'w0rp/ale'
Plug 'airblade/vim-gitgutter'
Plug 'editorconfig/editorconfig-vim'
Plug 'pangloss/vim-javascript'
let g:javascript_plugin_jsdoc = 1
Plug 'ternjs/tern_for_vim'
Plug 'Valloric/YouCompleteMe'
Plug 'mxw/vim-jsx'
" Allow jsx in js files
let g:jsx_ext_required = 0
Plug 'scrooloose/nerdtree'
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
let NERDTreeShowHidden=1
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'Raimondi/delimitMate'
let delimitMate_expand_cr = 1
Plug 'mattn/emmet-vim'
call plug#end()

set nocompatible
filetype off
set ic
set hlsearch
set incsearch
set number
set showmatch
highlight Comment ctermfg=LightCyan
set wrap
syntax on
set background=dark
autocmd Filetype gitcommit setlocal spell textwidth=72
filetype plugin indent on
set tabstop=2
set shiftwidth=2
set expandtab
" Search down into subfolders
" Provides tab-completion for all file-related tasks
set path+=**
" Display all matching files when we tab complete
set wildmenu
" Make vsplit put the new buffer on the right of the current buffer
set splitright
" Make split put the new buffer below the current buffer:
set splitbelow
set wildignore+=**/node_modules/**
set laststatus=2
colorscheme gruvbox
" Allow per project conf files
set exrc
" Disable unsafe commands in project-specific settings
set secure
set mouse=a
" Disable highlight until next search
nnoremap <silent><leader>c :let @/ = ""<CR>
nnoremap <leader>g :Ag<CR>
nnoremap <leader>f :Files<CR>
" Pass copied text to clipboard (works on normal and visual mode)
nnoremap y "+y
vnoremap y "+y
" Make buffer modifiable
set ma
"Custom Commands
command DeleteWhiteSpace call DeleteWhiteSpace()
" Quit from current buffer and move to previous one (does not close active window)
command Bd bp\|bd \#
" Functions
fun! DeleteWhiteSpace()
  let l:save = winsaveview()
  %s/\s\+$//e
  call winrestview(l:save)
endfun
