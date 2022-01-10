" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

call plug#begin('~/.config/nvim/autoload/plugged')
  Plug 'joshdick/onedark.vim'    " Colorsheme
  Plug 'sheerun/vim-polyglot'    " Syntax Highlight
  Plug 'ap/vim-css-color'        " Preview colours in source code
  Plug 'itchyny/lightline.vim'   " Status line / Tab line
  Plug 'vim-syntastic/syntastic' " Syntax Checking
  Plug 'ctrlpvim/ctrlp.vim'      " Quick file search
  Plug 'airblade/vim-gitgutter'  " Shows git diff markers in the sign column
  Plug 'jiangmiao/auto-pairs'    " Insert or delete brackets, parens, quotes in pair
call plug#end()
