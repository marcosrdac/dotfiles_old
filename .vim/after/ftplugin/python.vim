" Run script on python3
nnoremap <silent> <F5> :!python3 %<CR>

" Opening Tag List
let Tlist_Auto_Open=0

" Breaking lines with more colums than 79
set textwidth=79

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

" align the new line indent with the previous line
set autoindent


inoremap #! #!/usr/bin/env python3<enter># -*- coding: utf-8 -*-<enter><enter>
