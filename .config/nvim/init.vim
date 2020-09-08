syntax on
set nocompatible
set t_Co=256
set encoding=utf-8
set background=dark
colorscheme xgm

" Plugins
source $HOME/.config/nvim/vim-plug/plugins.vim
"
" Indentation
set autoindent
set copyindent
set showtabline=4
set shiftwidth=4
set tabstop=4
set list
set listchars=eol:¶,tab:>·

" Aditional
set cursorline
set norelativenumber
set number
set laststatus=2
set noshowmode
set noshowcmd
set shortmess+=F
set showtabline=1

" Don't bother with backups
set noswapfile
set nobackup

autocmd BufWritePre * %s/\s\+$//e

 map <C-j>      :bnext<CR>
imap <C-j> <Esc>:bnext<CR>
 map <C-k>      :bprev<CR>
imap <C-k> <Esc>:bprev<CR>

let g:currentmode={
       \ 'n'  : 'NORMAL ',
       \ 'v'  : 'VISUAL ',
       \ 'V'  : 'V-Line ',
       \ '' : 'V-Block ',
       \ 'i'  : 'INSERT ',
       \ 'R'  : 'REPLACE ',
       \ 'Rv' : 'V-Replace ',
       \ 'c'  : 'COMAND ',
       \}

set statusline=
set statusline+=%1*\ %{toupper(g:currentmode[mode()])}
set statusline+=%2*\ %f\ "
set statusline+=%3*\ %{&modified?'[+]':''}

set statusline+=%=
set statusline+=\ %3*\ [%{&fileformat}]
set statusline+=%3*\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\ %1*\ %Y\  "

"Plugin Configuration
map <C-f> :NERDTreeToggle<CR>
