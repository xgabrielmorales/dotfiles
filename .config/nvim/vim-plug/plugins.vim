" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  "autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')
  Plug 'sainnhe/sonokai'         " Color Scheme
  Plug 'tpope/vim-surround'      " Indescribable, but it's cool
  Plug 'preservim/nerdtree'      " File system explorer
  Plug 'sheerun/vim-polyglot'    " Syntax Highlight
  Plug 'itchyny/lightline.vim'   " Status line / Tab line
  Plug 'ryanoasis/vim-devicons'  " Add icons to nerdtree
  Plug 'vim-syntastic/syntastic' " Syntax Checking
call plug#end()
