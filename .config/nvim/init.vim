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
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'kyazdani42/nvim-tree.lua'
  Plug 'gpanders/editorconfig.nvim'
  Plug 'windwp/nvim-autopairs'
  " --- Git ---
  Plug 'lewis6991/gitsigns.nvim'
  " -- Python ---
  Plug 'Vimjas/vim-python-pep8-indent'
  Plug 'm4xshen/smartcolumn.nvim'
  " --- LSP ---
  Plug 'neovim/nvim-lspconfig'
  " --- Completion ---
  Plug 'hrsh7th/nvim-cmp'
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'jose-elias-alvarez/null-ls.nvim'
call plug#end()

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
set fileformat=unix

set shortmess+=F

set mouse=niv
set spelllang=es
set clipboard=unnamedplus

set nowrap

"==========================================================================
nnoremap Q <Nop>
nnoremap <Esc><Esc> :nohlsearch<CR>

" Page down/up and center view
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz
