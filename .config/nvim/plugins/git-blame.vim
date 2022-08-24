let g:gitblame_enabled = 0
let g:gitblame_message_template = '<date>, <author>, <sha>'
let g:gitblame_date_format = '%d %b %Y - %H:%M:%S'

nnoremap <leader>gbi :GitBlameToggle<CR>
nnoremap <leader>gbo :GitBlameOpenCommitURL<CR>
