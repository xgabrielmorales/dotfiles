syntax on
set t_Co=256
set encoding=utf-8
colorscheme xgm

" Indentation
set autoindent
set copyindent
set showtabline=4
set shiftwidth=4
set tabstop=4
set listchars=eol:¶,tab:>·
set list

" Aditional
set cursorline
set norelativenumber
set number
set showmode!
set laststatus=2

" Don't bother with backups
set noswapfile
set nobackup

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
set statusline+=%3*\ %f
set statusline+=%3*\ %{&modified?'[+]':''}

set statusline+=%=
set statusline+=\ %3*\ [%{&fileformat}]
set statusline+=%3*\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\ %1*\ %Y\  
