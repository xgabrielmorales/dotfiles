let mapleader = ","
"==========================================================================
"  PLUGINS
"==========================================================================
call plug#begin('$HOME/.config/nvim/autoload/plugged')
  " --- Appearenace ---
  Plug 'joshdick/onedark.vim'    " Colorscheme
  Plug 'itchyny/lightline.vim'   " Status line
  Plug 'ap/vim-css-color'        " Preview colours in source code
  Plug 'lukas-reineke/indent-blankline.nvim'
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  " --- Utilities ---
  Plug 'ctrlpvim/ctrlp.vim'       " Quick file search

  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }

  Plug 'kyazdani42/nvim-tree.lua' " File system explorer
  Plug 'jiangmiao/auto-pairs'     " Insert or delete brackets, parens, quotes in pair
  Plug 'preservim/tagbar'         " Browse the tags of the current file
  " --- Git ---
  Plug 'tpope/vim-fugitive'      " Git integration whinin Neovim
  Plug 'f-person/git-blame.nvim' " Git blame integration whinin Neovim
  Plug 'airblade/vim-gitgutter'  " Shows git diff markers in the sign column
  " -- Python ---
  Plug 'Vimjas/vim-python-pep8-indent'
  " --- LSP ---
  Plug 'neovim/nvim-lspconfig'
  " --- Completion ---
  Plug 'hrsh7th/nvim-cmp'
  Plug 'hrsh7th/cmp-nvim-lsp'
call plug#end()

lua <<EOF
  require("_lsp")
  require("_treesitter")
  require("_cmp")
  require("_nvim-tree")
  require("_telescope")
EOF

for f in glob('$HOME/.config/nvim/plugins/*.vim', 0, 1)
  execute 'source' f
endfor
"==========================================================================
"  EXTRA
"==========================================================================
source $HOME/.config/nvim/compile.vim
"==========================================================================
" APARIENCIA
"==========================================================================
set termguicolors
colorscheme onedark
"==========================================================================
" INDENTACIÓN
"==========================================================================
set autoindent
set smartindent

set tabstop=4
set shiftwidth=4
set softtabstop=0
set noexpandtab
"==========================================================================
" CONFIGURACIÓN PRINCIPAL
"==========================================================================
set number
set relativenumber
set cursorline

set laststatus=3
set showtabline=1

set noshowcmd
set noshowmode

set nobackup
set noswapfile

set list
set listchars=tab:!·,trail:-,eol:¶

set shortmess+=F

set mouse=niv
set spelllang=es
set clipboard=unnamedplus
"==========================================================================
" ATAJOS DE TECLADO
"==========================================================================
nnoremap Q <Nop>
nnoremap <Esc><Esc> :nohlsearch<CR>
