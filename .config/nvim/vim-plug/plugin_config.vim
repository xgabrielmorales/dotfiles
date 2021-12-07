let mapleader = ","
"+===============================================================================+
" NERDTREE
"+===============================================================================+
map <C-f> :NERDTreeToggle <CR>
let NERDTreeShowHidden=1
let NERDTreeMinimalUI=1
let NERDTreeMinimalMenu=1
let NERDTreeSortOrder=['[[extension]]']
let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''
let NERDTreeCustomOpenArgs={'file':{'where': 't'}}
let NERDTreeQuitOnOpen=1

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree")
      \ && b:NERDTree.isTabTree()) | q | endif
autocmd BufWinEnter * silent NERDTreeMirror
"+===============================================================================+
" LIGHTLINE.VIM
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
" ONE DARK
"+===============================================================================+
let g:onedark_terminal_italics = 1
let g:onedark_hide_endofbuffer = 1
"+===============================================================================+
" SYNTASTIC
"+===============================================================================+
nnoremap <F2> :SyntasticCheck<CR>
"+===============================================================================+
" VIM GITGUTTER
"+===============================================================================+
let g:gitgutter_map_keys = 0
set updatetime=100
let g:gitgutter_sign_added = ''
let g:gitgutter_sign_modified = ''
let g:gitgutter_sign_removed = ''
let g:gitgutter_sign_modified_removed = ''

nnoremap <leader>gi :GitGutterPreviewHunk<cr>
nnoremap <leader>gs :GitGutterStageHunk<cr>
nnoremap <leader>gu :GitGutterUndoHunk<cr>
nnoremap <leader>gn :GitGutterNextHunk<cr>
nnoremap <leader>gp :GitGutterPrevHunk<cr>
"+===============================================================================+
" Ctrlp
"+===============================================================================+
let g:ctrlp_map = '<M-f>'

let g:ctrlp_show_hidden = 1
let g:ctrlp_custom_ignore = {
	\ 'dir':  '\v[\/]\.(git|hg|svn|env)$',
	\ 'file': '\v\.(exe|so|dll|sqlite3)$',
	\ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
	\ }
