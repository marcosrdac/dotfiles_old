" Run script on python3
nnoremap <silent> <F5> :!pandoc % \| lynx -stdin<CR>

" align the new line indent with the previous line
set autoindent

map <leader>w yiWi[<esc>Ea](<esc>pa)
inoremap ,n ---<Enter><Enter>
inoremap ,b ****<++><Esc>F*hi
inoremap ,s ~~~~<++><Esc>F~hi
inoremap ,e **<++><Esc>F*i
inoremap ,h ====<Space><++><Esc>F=hi
inoremap ,i ![](<++>)<++><Esc>F[a
inoremap ,a [](<++>)<++><Esc>F[a
inoremap ,1 #<Space><Enter><++><Esc>kA
inoremap ,2 ##<Space><Enter><++><Esc>kA
inoremap ,3 ###<Space><Enter><++><Esc>kA
inoremap ,l --------<Enter>
"inoremap ,r ```{r}<CR>```<CR><CR><esc>2kO
"inoremap ,p ```{python}<CR>```<CR><CR><esc>2kO
"inoremap ,c ```<cr>```<cr><cr><esc>2kO
