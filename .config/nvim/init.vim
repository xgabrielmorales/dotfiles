"==========================================================================
"  PLUGINS
"==========================================================================
source $HOME/.config/nvim/vim-plug/plugins.vim
source $HOME/.config/nvim/vim-plug/plugin_config.vim
"==========================================================================
" CONFIGURACIÓN DE COLOR DE VIM
"==========================================================================
set nocompatible
colorscheme onedark
if exists('+termguicolors')
	set termguicolors
	let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
	let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
"==========================================================================
" INDENTACIÓN
"==========================================================================
set autoindent          " Copia la sangría de la línea anterior
set smartindent         " Inserta automáticamente un nivel de sangría extra
set noexpandtab         " No expande los tabs a espacios
set tabstop=4           " Espacios de indentación en modo insertar
set shiftwidth=4        " Espacios de indentación en modo normal
set softtabstop=0
"==========================================================================
" CONFIGURACIÓN PRINCIPAL
"==========================================================================
set cursorline          " Muestra la ubicación de la linea cursor
set number              " Enumera las líneas
set relativenumber      " Enumera las líneas relativo a la posición del cursorline
set laststatus=2        " Muestra la línea de estado

set nobackup            " Evita que Vim haga backups
set noswapfile          " Evita que Vim cree swapfiles
set foldmethod=manual   " Define el método de pliegues
set showtabline=1       " Muestra la tabline solo cunado hay más de una pestaña

set spelllang=es        " Idioma del corrector ortográfico

set list
set listchars=tab:!·,trail:-,eol:¶
set clipboard=unnamedplus
set noshowmode
set noshowcmd
set shortmess+=F
"==========================================================================
" ATAJOS DE TECLADO
"==========================================================================
" Activa y desactiva la corrección ortográfica con F3
nnoremap <silent> <F3> :set spell!<cr>
inoremap <silent> <F3> <C-O>:set spell!<cr>

" Activa o desactiva el Text Wraping (Ajuste de texto)
nnoremap <silent> <F4> :set wrap!<cr>
inoremap <silent> <F4> <C-O>:set wrap!<cr>

" Borra el resaltado de la búsqueda
nnoremap <silent> <Esc><Esc> :nohlsearch <CR>
"==========================================================================
"  OTRAS CONFIGURACIONES
"==========================================================================
" Borra automáticamente los espacios sobrantes al final de la línea
autocmd BufWritePre * %s/\s\+$//e

" Abrir la ayuda de vim (vim help) en una ventana vertical
autocmd FileType help wincmd L

" HARD ASS MODE
for key in ['<Up>', '<Down>', '<Left>', '<Right>']
	exec 'noremap' key '<Nop>'
	exec 'inoremap' key '<Nop>'
	"exec 'cnoremap' key '<Nop>'
endfor

" Abre y cierra los plieges de texto con la barra de espaciadora.
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf

" Compilar o ejecutar archivos rapidamente desde vim
autocmd FileType c      nnoremap <buffer><silent><f5> :!gcc % -lm && ./a.out <cr>
autocmd FileType cpp    nnoremap <buffer><silent><f5> :!g++ % -lm && ./a.out <cr>
autocmd FileType python nnoremap <buffer><silent><f5> :!python %<cr>

" Define el tipo de indentación de acuerdo al tipo de archivo
autocmd FileType css    setlocal expandtab tabstop=4 shiftwidth=4
autocmd FileType html   setlocal expandtab tabstop=2 shiftwidth=2
autocmd FileType python setlocal expandtab tabstop=4 shiftwidth=4
autocmd Filetype tex    setlocal expandtab tabstop=2 shiftwidth=2

" Define la longitud de una linea de texto en archivos de texto.
" Nota: Con el shortcut 'gq' re-formateamos una linea previamente seleccionada.
autocmd BufRead,BufNewFile *.md  setlocal textwidth=72
autocmd BufRead,BufNewFile *.tex setlocal textwidth=72
