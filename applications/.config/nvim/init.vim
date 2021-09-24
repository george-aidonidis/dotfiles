" Install Vim Plug if not installed
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.config/nvim/plugged')
Plug 'ryanoasis/vim-devicons'
Plug 'tpope/vim-repeat'
Plug 'machakann/vim-sandwich'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-rhubarb' "Gbrowse
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-sensible'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'romgrk/barbar.nvim'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sheerun/vim-polyglot'

Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
" Plug 'itchyny/lightline.vim'
Plug 'christoomey/vim-system-copy'
Plug 'dstein64/vim-startuptime'
Plug 'mhinz/vim-startify'
Plug 'mattn/emmet-vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'
Plug 'christoomey/vim-tmux-navigator'

Plug 'janko/vim-test'
Plug 'mbbill/undotree'
Plug 'liuchengxu/vim-which-key'
call plug#end()

"""""""""""""""""""""""
" Performance options "
"""""""""""""""""""""""
" set lazyredraw

so ~/dotfiles/applications/.config/nvim/custom/key-bindings.vim
so ~/dotfiles/applications/.config/nvim/custom/search.vim
so ~/dotfiles/applications/.config/nvim/custom/text-render.vim
so ~/dotfiles/applications/.config/nvim/custom/indent.vim
so ~/dotfiles/applications/.config/nvim/custom/folding.vim
so ~/dotfiles/applications/.config/nvim/custom/misc.vim
so ~/dotfiles/applications/.config/nvim/custom/commands.vim
so ~/dotfiles/applications/.config/nvim/custom/user-interface.vim

" let g:neosnippet#enable_completed_snippet = 1
autocmd BufWritePost ~/dotfiles/homeconfig/.bm* !shortcuts

" lua require'lspconfig'.tsserver.setup{}

