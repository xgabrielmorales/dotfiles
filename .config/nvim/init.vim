" Plugins
source $HOME/.config/nvim/vim-plug/plugins.vim
" Configuración de los plugins
source $HOME/.config/nvim/vim-plug/plugin_config.vim

set nocompatible
colorscheme sonokai
if exists('+termguicolors')
    set termguicolors
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Indentación
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set autoindent    "Copia la sangría de la línea anterior
set smartindent   "Inserta automáticamente un nivel de sangría extra
set noexpandtab   " No expande los tabs a espacios
set tabstop=4     " Espacios de indentación en modo insertar
set shiftwidth=4  " Espacios de indentación en modo normal
set softtabstop=0
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set list
set listchars=tab:>·,trail:-,eol:¶

set cursorline     " Muestra la ubicación de la linea cursor
set number         " Enumera las líneas
set relativenumber " Número de lineas relativo a la posición del cursorline
set laststatus=2   " Muestra la línea de estado

set nobackup          " Evita que vim haga backups
set noswapfile        " Evita cree swapfiles
set foldmethod=manual " Define el método de pliegues
set showtabline=1     " Muestra la tabline solo cunado hay más de una tab
                      " presente

set noshowmode
set noshowcmd
set shortmess+=F

set spelllang=es      " Idioma del corrector ortográfico
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Activa y desactiva la corrección ortográfica con F3
nnoremap <silent> <F3> :set spell!<cr>
inoremap <silent> <F3> <C-O>:set spell!<cr>

" Activa o desactiva el Text Wraping (Ajuste de texto)
nnoremap <silent> <F4> :set wrap!<cr>
inoremap <silent> <F4> <C-O>:set wrap!<cr>

" Borra el resaltado de la búsqueda
nnoremap <silent> <Esc><Esc> :nohlsearch <CR>

" Borra automáticamente los espacios sobrantes al final de la línea
autocmd BufWritePre * %s/\s\+$//e

" Compilar archivos desde vim
autocmd FileType c   nnoremap <buffer><silent><f5> :!gcc % -lm && ./a.out <cr>
autocmd FileType cpp nnoremap <buffer><silent><f5> :!g++ % && ./a.out <cr>
autocmd FileType tex nnoremap <buffer><silent><f5> :!xelatex % && zathura %:r.pdf<cr>

" Define el tipo de indentación de acuerdo al tipo de archivo
autocmd FileType html setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType css  setlocal tabstop=2 shiftwidth=2 softtabstop=2

" Formatea automaticamente la longitud de una linea de texto en archivos de
" texto.
autocmd BufRead,BufNewFile *.md  setlocal textwidth=90
autocmd BufRead,BufNewFile *.tex setlocal textwidth=90
" Nota: Con el shortcut 'gq' re-formateamos una linea previamente seleccionada.
