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
