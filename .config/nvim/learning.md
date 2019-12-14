# abreviações
ab rtfm read the fine manual

# inserindo o alfabeto
:r !printf '\%s' {a..z}

# knowing the encoding
set fileencoding

# functions
Functions in vim are like this:

:function ToggleNumbering()
:   if &relativenumber == 1
:       set norelativenumber
:   else
:       set relativenumber
:   endif
:endfunction


# bracketing by hand (may be useful someday)
" -- bracketing -- "
"inoremap ( ()<++><Esc>4hi
"inoremap ( ()<++><C-o>4h
"inoremap [ []<++><Esc>4hi
"inoremap { {}<++><Esc>4hi
"inoremap < <><++><Esc>4hi
"inoremap " ""<++><Esc>4hi
"inoremap ' ''<++><Esc>4hi
"inoremap (<Space> (
"inoremap [<Space> [
"inoremap {<Space> {
"inoremap <<Space> <
"inoremap "<Space> "
"inoremap '<Space> '
"inoremap () ()
"inoremap [] []
"inoremap {} {}
"inoremap <> <>
"inoremap "" ""
"inoremap '' ''
"vnoremap s( <Esc>`>a)<Esc>`<i(<Esc><C-o>
"vnoremap s[ <Esc>`>a]<Esc>`<i[<Esc><C-o>
"vnoremap s{ <Esc>`>a}<Esc>`<i{<Esc><C-o>
"vnoremap s< <Esc>`>a><Esc>`<i<<Esc><C-o>
"vnoremap s" <Esc>`>a"<Esc>`<i"<Esc><C-o>
"vnoremap s' <Esc>`>a'<Esc>`<i'<Esc><C-o>


# tmux navigator does that now
"" remaping window moviment in i3 way
"map <C-h> <C-w>h
"map <C-j> <C-w>j
"map <C-k> <C-w>k
"map <C-l> <C-w>l
