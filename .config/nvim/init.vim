" Plugins
source $HOME/.config/nvim/vim-plug/plugins.vim
" Configuración de los plugins.
source $HOME/.config/nvim/vim-plug/plugin_config.vim

set nocompatible
colorscheme sonokai
if exists('+termguicolors')
    set termguicolors
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Indentación
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set autoindent   "Copia la sangría de la línea anterior.
set smartindent  "Inserta automáticamente un nivel de sangría extra.
set tabstop=4    "Define la longitud del tab.
set shiftwidth=4 "Espacios de indentación.
set noexpandtab  "No expande las tabulaciones.

" Define el tipo de indentación de acuerdo al tipo de archivo.
autocmd FileType html setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType css  setlocal tabstop=2 shiftwidth=2 softtabstop=2

" Borra automáticamente los espacios sobrantes al final de la línea
autocmd BufWritePre * %s/\s\+$//e
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set list
set listchars=tab:!·,trail:-,eol:¶

set cursorline     "Muestra la ubicación de la linea cursor.
set number         "Enumera las líneas
set relativenumber "Número de lineas relativo a la posición del cursorline.
set laststatus=2   "Muestra la línea de estado.

set noshowmode
set noshowcmd
set shortmess+=F

set nobackup          "Evita que vim haga backups.
set noswapfile        "Evita cree swapfiles.
set showtabline=1     "Muestra la tabline solo cunado hay más de una tab presente.
set foldmethod=manual "Define el metodo de plieges

set spelllang=es      "Corrector Ortográfico..

" Activa y desactiva la corrección ortográfica con F3.
nnoremap <silent> <F3> :set spell!<cr>
inoremap <silent> <F3> <C-O>:set spell!<cr>
" Borra el resaltado de la búsqueda.
nnoremap <silent> <Esc><Esc> :nohlsearch <CR>
" Compilar archivos desde vim
autocmd FileType c   nnoremap <buffer><silent><f5> :!gcc % -o compilado.c<cr>
autocmd FileType cpp nnoremap <buffer><silent><f5> :!g++ % -o compilado.cpp<cr>
autocmd FileType tex nnoremap <buffer><silent><f5> :!xelatex % && zathura %:r.pdf<cr>
