map <C-f> :NERDTreeToggle <CR>
let NERDTreeShowHidden=1
let NERDTreeSortOrder=['[[extension]]']
let NERDTreeQuitOnOpen=1
let NERDTreeIgnore=['\.pyc$', '\~$']

let NERDTreeMinimalUI=1
let NERDTreeMinimalMenu=1
let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''

" Close NerdTree if it is the only open window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree")
      \ && b:NERDTree.isTabTree()) | q | endif
" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif
