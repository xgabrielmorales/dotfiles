let mapleader = ","
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
      \   'gitbranch': 'FugitiveHead',
      \   'filename': 'LightlineFilename',
      \ },
      \ }

" https://github.com/itchyny/lightline.vim/issues/293#issuecomment-373710096
function! LightlineFilename()
  let root = fnamemodify(get(b:, 'git_dir'), ':h')
  let path = expand('%:p')
  if path[:len(root)-1] ==# root
    return path[len(root)+1:]
  endif
  return expand('%')
endfunction

"+===============================================================================+
" ONE DARK
"+===============================================================================+
let g:onedark_terminal_italics = 1
let g:onedark_hide_endofbuffer = 1
"+===============================================================================+
" SYNTASTIC
"+===============================================================================+
nnoremap <F2> :SyntasticCheck<CR>
let g:syntastic_echo_current_error = 1
let g:syntastic_check_on_open = 1
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
nnoremap <leader>t :CtrlPTag<cr>
nnoremap <leader>b :CtrlPBuffer<cr>

let g:ctrlp_show_hidden = 1
let g:ctrlp_custom_ignore = {
	\ 'dir':  '\v[\/]\.(git|hg|svn|env)$',
	\ 'file': '\v\.(exe|so|dll|sqlite3)$',
	\ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
	\ }
