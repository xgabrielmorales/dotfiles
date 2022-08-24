let g:ctrlp_map = '<leader>f'
nnoremap <leader>b :CtrlPBuffer<cr>

let g:ctrlp_show_hidden = 1
let g:ctrlp_custom_ignore = {
	\ 'dir':  '\v[\/]\.(git|hg|svn|env)$',
	\ 'file': '\v\.(exe|so|dll|sqlite3)$',
	\ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
	\ }
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
