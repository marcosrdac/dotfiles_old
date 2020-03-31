" quick-scope on key-press
"let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
highlight QuickScopePrimary   ctermfg=5 cterm=underline guifg=5 gui=underline
highlight QuickScopeSecondary ctermfg=6 cterm=underline guifg=6 gui=underline


" NERDTree
"   ignoring node modules
let g:NERDTreeIgnore = ['^node_modules$', '^.git$', '\.pyc$', '\~$']
" vim-nerdtree-syntax-highlight
"   diminishing lag
let g:NERDTreeLimitedSyntax = 1
"   highlighting entire line
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1


" CtrlP
let g:ctrlp_user_command = ['.git/',
            \ 'git --git-dir=%s/.git ls-files -oc --exclude-standard']


" ALE
" Disable auto-detection of virtualenvironments
"let g:ale_virtualenv_dir_names = [expand('$VIRTUAL_ENV')]
" Environment variable ${VIRTUAL_ENV} is always used
" pylint has the errors
" Check Python files with flake8 and pylint.
let b:ale_linters = ['flake8']  " , 'pylint']
" Fix Python files with autopep8 and yapf.
let b:ale_fixers = ['autopep8', 'yapf']
" Disable warnings about trailing whitespace for Python files.
let b:ale_warn_about_trailing_whitespace = 0
" take a look at this site
"   http://blog.algarvio.me/2012/12/27/pylint-+-virtualenv/
let g:ale_python_pylint_executable = 'pylint'


" deoplete
"   setting python hosts
" tell deoplete where to search right binarys
let g:deoplete#sources#jedi#python_path=expand('$VIRTUAL_ENV/bin/python')
"   fallback
let g:deoplete#sources#jedi#extra_path='/bin/python'
let g:jedi#auto_initialization = 0
" Use deoplete.
let g:deoplete#enable_at_startup = 1
let g:deoplete#auto_completion_start_length = 0
let g:deoplete#enable_camel_case = 1
" setting a little delay for windows to appear
call deoplete#custom#option('auto_complete_delay', 50)


" Goyo / Limelight
" automating limelight plugin to follow goyo
"autocmd! User GoyoEnter Limelight
"autocmd! User GoyoLeave Limelight!


" vim-tmux-navigator
let g:tmux_navigator_no_mappings = 0


" delimitMate
let delimitMate_expand_cr = 1
