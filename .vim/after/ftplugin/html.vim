" Run script on python3
nnoremap <silent> <F5> :!google-chrome % &<CR>

" Turning a hard TAB into 4 colums
set tabstop=4

" Insert spaces when hitting tabs
set expandtab

" Indenting 4 columns, unindenting 4 columns
set shiftwidth=4

" Round indent to multiple of 'shiftwidth'
set shiftround

" insert/delete 4 spaces when hitting a tab/backspace
set softtabstop=4


imap +e <Plug>(emmet-expand-abbr)
imap !! <Plug>(emmet-toogle-comment)
imap +i <Plug>(emmet-image-size)
imap +j <Plug>(emmet-split-join-tag)
