""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" [en] I dont use vim, better go to my nvim config.
" [es] Ya no uso vim, mejor vé a mi configuración de nvim.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"[en] Colorscheme, fonts and systax
"[es] Esquema de colores, fuente tipografica y sintaxis
syntax on
set t_Co=256
set encoding=utf-8
colorscheme xgm

"[en] Identation
"[es] Identación
set autoindent
set showtabline=4
set shiftwidth=4
set tabstop=4
set listchars=eol:¶,tab:>·
set list

"[en] Don't bother with backups
"[es] No jodas con los backups
set noswapfile
set nobackup
set copyindent

"[en] Aditional
"[es] Adicionales
set cursorline
set norelativenumber
set number

"[en] Switching relativenumber
"[es] Cambiar la numoeración de las lineas
nmap <F5> :set relativenumber <CR>
nmap <F4> :set norelativenumber <CR>

"[en] Delete blanks at the end of each line
"[es] Borra todos los espacios al final de cada linea
autocmd BufWritePre * %s/\s\+$//e
