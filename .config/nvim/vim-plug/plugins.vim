" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

call plug#begin('~/.config/nvim/autoload/plugged')
  Plug 'joshdick/onedark.vim'     " Colorsheme
  Plug 'sheerun/vim-polyglot'     " Syntax Highlight
  Plug 'vim-syntastic/syntastic'  " Syntax Checking
  Plug 'ryanoasis/vim-devicons'   " Add icons to NERDTree
  Plug 'itchyny/lightline.vim'    " Status line / Tab line
  Plug 'itchyny/vim-gitbranch'    " Provides the branch name of the current git repository
  Plug 'preservim/nerdtree'       " File system explorer (NERDTree)
  Plug 'jiangmiao/auto-pairs'     " Insert or delete brackets, parens, quotes in pair
  Plug 'airblade/vim-gitgutter'   " Shows git diff markers in the sign column
  Plug 'lervag/vimtex'            " LaTeX support in Vim
  Plug 'ap/vim-css-color'         " Preview colours in source code
  Plug 'SirVer/ultisnips'
call plug#end()
