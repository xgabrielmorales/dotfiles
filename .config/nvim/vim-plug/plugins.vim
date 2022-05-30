" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

call plug#begin('~/.config/nvim/autoload/plugged')
  " Appearenace
  Plug 'joshdick/onedark.vim'    " Colorscheme
  Plug 'rakr/vim-one'            " Colorscheme
  Plug 'itchyny/lightline.vim'   " Status line
  Plug 'ap/vim-css-color'        " Preview colours in source code
  " Utilities
  Plug 'sheerun/vim-polyglot'    " Syntax Highlight
  Plug 'vim-syntastic/syntastic' " Syntax Checking
  Plug 'ctrlpvim/ctrlp.vim'      " Quick file search
  Plug 'jiangmiao/auto-pairs'    " Insert or delete brackets, parens, quotes in pair
  " Git
  Plug 'tpope/vim-fugitive'      " Git integration whinin vim
  Plug 'airblade/vim-gitgutter'  " Shows git diff markers in the sign column
  " Snippets
  Plug 'SirVer/ultisnips',   {'for': 'html'} " Snippets engine
  Plug 'honza/vim-snippets', {'for': 'html'} " Snippets privider
call plug#end()
