let mapleader = ","
"==========================================================================
"  PLUGINS
"==========================================================================
call plug#begin('$HOME/.config/nvim/autoload/plugged')
  " --- Appearenace ---
  Plug 'joshdick/onedark.vim'
  Plug 'nvim-lualine/lualine.nvim'
  Plug 'ap/vim-css-color'
  Plug 'lukas-reineke/indent-blankline.nvim'
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  " --- Utilities ---
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
  Plug 'kyazdani42/nvim-tree.lua'
  Plug 'jiangmiao/auto-pairs'
  Plug 'simrat39/symbols-outline.nvim'
  " --- Git ---
  Plug 'tpope/vim-fugitive'
  Plug 'f-person/git-blame.nvim'
  Plug 'airblade/vim-gitgutter'
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
  require("_symbols-outline")
  require("_lualine")
EOF

for f in glob('$HOME/.config/nvim/plugins/*.vim', 0, 1)
  execute 'source' f
endfor
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

set laststatus=2
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
