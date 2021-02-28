" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  "autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')
  Plug 'joshdick/onedark.vim'     " Colorsheme
  Plug 'tpope/vim-surround'       " Indescribable, but it's cool
  Plug 'preservim/nerdtree'       " File system explorer (NERDTree)
  Plug 'sheerun/vim-polyglot'     " Syntax Highlight
  Plug 'vim-syntastic/syntastic'  " Syntax Checking
  Plug 'itchyny/lightline.vim'    " Status line / Tab line
  Plug 'itchyny/vim-gitbranch'    " Provides the branch name of the current git repository
  Plug 'ryanoasis/vim-devicons'   " Add icons to NERDTree
  Plug 'jiangmiao/auto-pairs'     " Insert or delete brackets, parens, quotes in pair
  Plug 'airblade/vim-gitgutter'   " Shows git diff markers in the sign column
call plug#end()
