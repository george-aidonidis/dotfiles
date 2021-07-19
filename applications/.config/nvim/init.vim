" Install Vim Plug if not installed
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.config/nvim/plugged')
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'
" Plug 'nvim-lua/completion-nvim'
" Plug 'nvim-lua/diagnostic-nvim'
" Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'ryanoasis/vim-devicons'
Plug 'tpope/vim-repeat'
Plug 'machakann/vim-sandwich'
Plug 'tpope/vim-rhubarb' "Gbrowse
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-sensible'
Plug 'bagrat/vim-buffet'

" Plug 'leafgarland/typescript-vim'
" Plug 'peitalin/vim-jsx-typescript'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'mgee/lightline-bufferline'
" Plug 'christoomey/vim-sort-motion'

Plug 'folke/tokyonight.nvim'

" Plug 'itchyny/lightline.vim'
Plug 'christoomey/vim-system-copy'
" Plug 'editorconfig/editorconfig-vim'
Plug 'mattn/emmet-vim'
Plug 'sheerun/vim-polyglot'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'
" Plug 'christoomey/vim-tmux-navigator'

Plug 'qpkorr/vim-bufkill'
Plug 'janko/vim-test'
" Plug 'yuki-ycino/fzf-preview.vim'
Plug 'mbbill/undotree'
Plug 'liuchengxu/vim-which-key'
call plug#end()

"""""""""""""""""""""""
" Performance options "
"""""""""""""""""""""""
set lazyredraw

so ~/dotfiles/applications/.config/nvim/custom/key-bindings.vim
so ~/dotfiles/applications/.config/nvim/custom/search.vim
so ~/dotfiles/applications/.config/nvim/custom/text-render.vim
so ~/dotfiles/applications/.config/nvim/custom/indent.vim
so ~/dotfiles/applications/.config/nvim/custom/folding.vim
so ~/dotfiles/applications/.config/nvim/custom/misc.vim
so ~/dotfiles/applications/.config/nvim/custom/commands.vim
so ~/dotfiles/applications/.config/nvim/custom/user-interface.vim

let g:neosnippet#enable_completed_snippet = 1
autocmd BufWritePost ~/dotfiles/homeconfig/.bm* !shortcuts

lua require'lspconfig'.tsserver.setup{ on_attach=on_attach }

