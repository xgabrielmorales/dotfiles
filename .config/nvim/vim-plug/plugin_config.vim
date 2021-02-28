"+===============================================================================+
"                                   NERDTree
"+===============================================================================+
map <C-f> :NERDTreeToggle <CR>
let NERDTreeShowHidden=1
let NERDTreeSortOrder=['[[extension]]']
let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''
let NERDTreeCustomOpenArgs={'file':{'where': 't'}}
let NERDTreeQuitOnOpen=1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree")
      \ && b:NERDTree.isTabTree()) | q | endif
autocmd BufWinEnter * silent NERDTreeMirror
"+===============================================================================+
"                                Lightline.vim
"+===============================================================================+
let g:lightline = {
      \ 'colorscheme': 'onedark',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'gitbranch#name'
      \ },
      \ }
"+===============================================================================+
"                                  One Dark
"+===============================================================================+
let g:onedark_terminal_italics = 1
let g:onedark_hide_endofbuffer = 1
"+===============================================================================+
"                                Syntastic
"+===============================================================================+
nnoremap <F2> :SyntasticCheck<CR>
"+===============================================================================+
"                                Vim gitgutter
"+===============================================================================+
set updatetime=100
