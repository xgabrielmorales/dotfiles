let mapleader = ","

"==========================================================================
call plug#begin('$HOME/.config/nvim/autoload/plugged')
  " --- Appearenace ---
  Plug 'navarasu/onedark.nvim'
  Plug 'nvim-lualine/lualine.nvim'
  Plug 'lukas-reineke/indent-blankline.nvim'
  Plug 'nvim-treesitter/nvim-treesitter'
  " --- Utilities ---
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
  Plug 'kyazdani42/nvim-tree.lua'
  Plug 'gpanders/editorconfig.nvim'
  Plug 'windwp/nvim-autopairs'
  " --- Git ---
  Plug 'lewis6991/gitsigns.nvim'
  " -- Python ---
  Plug 'Vimjas/vim-python-pep8-indent'
  " --- LSP ---
  Plug 'neovim/nvim-lspconfig'
  " --- Completion ---
  Plug 'hrsh7th/nvim-cmp'
  Plug 'hrsh7th/cmp-nvim-lsp'
call plug#end()

"==========================================================================
set termguicolors
colorscheme onedark

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

set nowrap

"==========================================================================
nnoremap Q <Nop>
nnoremap <Esc><Esc> :nohlsearch<CR>
