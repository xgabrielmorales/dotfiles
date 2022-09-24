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
set noexpandtab

set tabstop=4
set shiftwidth=4
set softtabstop=0

" Redefine la indentación (a espacios) de acuerdo al tipo de archivo
autocmd FileType sh     setlocal expandtab softtabstop=4
autocmd FileType xml    setlocal expandtab softtabstop=4
autocmd FileType css    setlocal expandtab softtabstop=4
autocmd FileType html   setlocal expandtab softtabstop=4
autocmd FileType python setlocal expandtab softtabstop=4
autocmd FileType lua    setlocal expandtab tabstop=2 shiftwidth=2
autocmd FileType vim    setlocal expandtab tabstop=2 shiftwidth=2
"==========================================================================
" CONFIGURACIÓN PRINCIPAL
"==========================================================================
set cursorline        " Muestra la ubicación de la linea cursor
set number            " Enumera las líneas
set relativenumber    " Enumera las líneas relativo a la linea cursor
set laststatus=2      " Muestra la línea de estado

set nobackup          " Evita que Vim haga backups
set noswapfile        " Evita que Vim cree swapfiles
set foldmethod=manual " Define el método de pliegues
set showtabline=1     " Muestra la tabline solo cunado hay más de una pestaña

set spelllang=es      " Idioma del corrector ortográfico
set mouse=niv         " Habilita el uso de mouse

set list
set listchars=tab:!·,trail:-,eol:¶
set clipboard=unnamedplus
set noshowmode
set noshowcmd
set shortmess+=F
"==========================================================================
" ATAJOS DE TECLADO
"==========================================================================

" HARD ASS MODE
for key in ['<Up>', '<Down>', '<Left>', '<Right>']
  exec 'noremap'  key '<Nop>'
  exec 'inoremap' key '<Nop>'
  exec 'cnoremap' key '<Nop>'
endfor

" Disable Ex-Mode
nnoremap Q <Nop>

" Borra el resaltado de la búsqueda
nnoremap <silent> <Esc><Esc> :nohlsearch <CR>

" Abre y cierra los plieges de texto con la barra de espaciadora.
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf

" TERMINAL
autocmd TermOpen * setlocal nonumber norelativenumber
tnoremap <Esc> <C-\><C-n>

" Emacs keybindings in Command Mode
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <M-b> <S-Left>
cnoremap <M-f> <S-Right>
cnoremap <C-d> <Del>
"==========================================================================
"  OTRAS CONFIGURACIONES
"==========================================================================
" Borra automáticamente los espacios sobrantes al final de la línea
" autocmd BufWritePre * %s/\s\+$//e

" Define la longitud de una linea de texto en archivos de texto.
" Nota: Con el shortcut 'gq' re-formateamos una linea previamente seleccionada.
autocmd BufRead,BufNewFile *.md  setlocal textwidth=72
autocmd BufRead,BufNewFile *.tex setlocal textwidth=72
