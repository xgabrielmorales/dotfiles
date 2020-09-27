" Plugins
source $HOME/.config/nvim/vim-plug/plugins.vim

syntax on
set nocompatible
colorscheme onedark
set background=dark

set autoindent
set copyindent
set tabstop=4
set shiftwidth=4
set showtabline=4
set list
set listchars=eol:¶,tab:>·
set cursorline
set number
set relativenumber
set laststatus=2
set noshowmode
set noshowcmd
set shortmess+=F
set showtabline=1
set nobackup
set noswapfile
set foldmethod=manual
set termguicolors

autocmd BufWritePre * %s/\s\+$//e

 map <C-j>      :bnext<CR>
imap <C-j> <Esc>:bnext<CR>
 map <C-k>      :bprev<CR>
imap <C-k> <Esc>:bprev<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <C-f> :NERDTreeToggle <CR>
let NERDTreeShowHidden=1
let g:NERDTreeDirArrowExpandable = '|'
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Lightline.vim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:lightline = {"colorscheme": "one"}
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntastic
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <C-s> :SyntasticCheck<CR>
