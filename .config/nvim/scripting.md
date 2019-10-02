example

```vim
" Override w motion
function! MyWMotion()
    " Save the initial position
    let initialLine=line('.')

    " Execute the builtin word motion and get the new position
    normal! w
    let newLine=line('.')

    " If the line as changed go back to the previous line
    if initialLine != newLine
        normal k$
    endif
endfunction

" Override b motion
function! MyBMotion()
    " Save the initial position
    let initialLine=line('.')

    " Execute the builtin word motion and get the new position
    normal! b
    let newLine=line('.')

    " If the line as changed go back to the previous line
    if initialLine != newLine
        normal j^
    endif
endfunction

nnoremap <silent> w :call MyWMotion()<CR>
nnoremap <silent> b :call MyBMotion()<CR>
```
