" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  "autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')
  Plug 'preservim/nerdtree'           "File system explorer
  Plug 'itchyny/lightline.vim'        "Status line / Tab line
  Plug 'sheerun/vim-polyglot'         "Syntax Highlight
  Plug 'vim-syntastic/syntastic'      "Syntax Checking
  Plug 'joshdick/onedark.vim'         "Color Scheme
  Plug 'ryanoasis/vim-devicons'       "Add icons to nerdtree
  Plug 'jiangmiao/auto-pairs'
  Plug 'tpope/vim-surround'
call plug#end()
