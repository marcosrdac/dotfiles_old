" nvimrc (neovim configuration file)

" --- plugin management --- "
call plug#begin('~/.vim/plugged')
    " essential
    "Plug 'vim-syntastic/syntastic'                  " syntax checking
    Plug 'dense-analysis/ale'                        " syntax checking
    Plug 'neoclide/coc.nvim', {'branch': 'release'} " intelligent completion
    Plug 'christoomey/vim-tmux-navigator'           " tmux navigation
    "Plug 'Raimondi/delimitMate'                     " closing brackets
    Plug 'tpope/vim-surround'                       " changing brackets
    Plug 'ctrlpvim/ctrlp.vim'                       " file fuzyfinder
    Plug 'scrooloose/nerdcommenter'                 " (un)comments text
    Plug 'norcalli/nvim-colorizer.lua'              " colors become colored
    Plug 'terryma/vim-expand-region'                " expanding selection

    " NERDTree
    Plug 'scrooloose/nerdtree'                      " file system explorer
    Plug 'Xuyuanp/nerdtree-git-plugin'              " NERDTree git marks
    Plug 'ryanoasis/vim-devicons'                   " file icons on NERDTree
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight'  " highlights filetypes

    " focused writing
    Plug 'junegunn/goyo.vim'        " center text
    Plug 'junegunn/limelight.vim'   " focused writing
call plug#end()


" --- general settings --- "
" aesthetics
colorscheme wal
"colorscheme default
" line numbering
set number relativenumber
" not redrawing screen while running macros
set lazyredraw
" increasing readability
"set textwidth=80
"set colorcolumn=+1
"au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
" highlighting searches
set hlsearch
" tab completion in command line
set wildmenu
set wildmode=list:longest,full
" using case insensitive on searches (not good...)
"set ic
" mouse selection in VIM
set mouse=a
" making a link between OS' and VIM's clipboard space (+ or *)
    "   (for clipboard persistency bug, remembere to use parcelline!)
"   something with unnamed or unnamedplus
set clipboard=unnamedplus
" adding to path
set path+=**
" enabling dictionary search when spell is on
set complete+=kspell
" making backups and undofiles (make sure the directory exists)
set dir=~/.cache/vim/swap
set backupdir=~/.cache/vim/backup
set undodir=~/.cache/vim/undo
set backup
set undofile


" --- automation and plugins setup --- "
" editing from where you were
au BufReadPost * if line("'\"") > 0 | if line("'\"") <= line("$") | exe("norm '\"") | else | exe "norm $" | endif | endif
" fold based on indent level and manual choices
"augroup vimrc
"  au BufReadPre * setlocal foldmethod=indent
"  au BufWinEnter * if &fdm == 'indent' | setlocal foldmethod=manual | endif
"augroup END
" deletes trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e
" xrdb whenever Xdefaults or Xresources are updated
autocmd BufWritePost ~/.Xresources,~/.Xdefaults !xrdb %
" update crontab when editing crontab file
"autocmd BufWritePost ~/.config/cron/crontab !crontab %
autocmd BufWritePost user.cron !crontab %
" update root crontab when editing root crontab file
"  Add to /etc/sudoers: "Defaults rootpw"
autocmd BufWritePost root.cron !st -e sudo crontab %
" generate site html files after _content files edition
" NOT WORKING IM DOING SOMETHINS STUPID
autocmd BufWritePost /home/marcosrdac/projects/site/marcosrdac.github.io/_content !python /home/marcosrdac/projects/site/marcosrdac.github.io/maker.py
" st + tmux + vim with correct cursor
if exists('$TMUX')
	let &t_SI = "\<Esc>Ptmux;\<Esc>\e[6 q\<Esc>\\"
	let &t_SR = "\<Esc>Ptmux;\<Esc>\e[4 q\<Esc>\\"
	let &t_EI = "\<Esc>Ptmux;\<Esc>\e[2 q\<Esc>\\"
else
	let &t_SI = "\e[6 q"
	let &t_SR = "\e[4 q"
	let &t_EI = "\e[2 q"
endif
" coc.vim
"   needed options
set hidden
" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300
" don't give |ins-completion-menu| messages.
set shortmess+=c
" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')
" Remap for rename current word
let mapleader=" "
nmap <leader>rn <Plug>(coc-rename)
" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end
" ALE
" Disable auto-detection of virtualenvironments
let g:ale_virtualenv_dir_names = []
" Environment variable ${VIRTUAL_ENV} is always used
" nvim-colorizer.lua needs
"set termguicolors
"lua require'colorizer'.setup()
" vim-tmux-navigator
let g:tmux_navigator_no_mappings = 0
" delimitMate
let delimitMate_expand_cr = 1
" NERDTree
"   ignoring node modules
let g:NERDTreeIgnore = ['^node_modules$']
" vim-nerdtree-syntax-highlight
"   diminishing lag
let g:NERDTreeLimitedSyntax = 1
"   highlighting entire line
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1
" CtrlP
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
" automating limelight plugin to follow goyo
"autocmd! User GoyoEnter Limelight
"autocmd! User GoyoLeave Limelight!


" --- dictionaries --- "
ab abc abcdefghijklmnopqrstuvwxyz


" --- mappings --- "
" setting leader
let mapleader=" "


" plugins
"   nerdtree
map <C-n> :NERDTreeToggle<CR>
" NERDCommenter <c-_> means <c-/>
nmap <c-_> <plug>NERDCommenterToggle
vmap <c-_> <plug>NERDCommenterToggle
"   ctrlp
map <space>o :CtrlP<CR>


" -- splitscreens -- "
" splitting in i3 way
set splitbelow splitright

" <c-{direction}>
"nnoremap <silent> {Left-Mapping} :TmuxNavigateLeft<cr>
"nnoremap <silent> {Down-Mapping} :TmuxNavigateDown<cr>
"nnoremap <silent> {Up-Mapping} :TmuxNavigateUp<cr>
"nnoremap <silent> {Right-Mapping} :TmuxNavigateRight<cr>
"nnoremap <silent> {Previous-Mapping} :TmuxNavigatePrevious<cr>

" vim-eexpand-region
map K <Plug>(expand_region_expand)
map J <Plug>(expand_region_shrink)

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

" -- function buttons -- "
" saving with <F1>
nmap <F1> :w<CR>
imap <F1> <C-o>:w<CR>

" mappings
nnoremap <C-\> :set number!<CR>
map <F7> :setlocal spell! spelllang=pt-BR,en_us<CR>
map <F8> :set hlsearch!<CR>

" -- navigation through marks -- "
" creating marks
inoremap m<leader><leader> <++>
nnoremap m<leader><leader> a<++><Esc>
" forward finding marks
inoremap f<leader><leader> <Esc>/<++><Enter>:noh<CR>"_c4l
vnoremap f<leader><leader> <Esc>/<++><Enter>:noh<CR>"_c4l
nnoremap f<leader><leader> <Esc>/<++><Enter>:noh<CR>"_c4l
" backward finding marks
inoremap F<leader><leader> <Esc>?<++><Enter>:noh<CR>"_c4l
vnoremap F<leader><leader> <Esc>?<++><Enter>:noh<CR>"_c4l
nnoremap F<leader><leader> <Esc>?<++><Enter>:noh<CR>"_c4l

" -- date stuff -- "
inoremap ;df <++><Esc>:r !date '+\%Y\%m\%d\%H\%M\%S'<Enter>0v$h"dd"_dd?<++><Enter>v3l"dpa
inoremap ;dl <++><Esc>:r !date '+[\%Y\%m\%d\%H\%M\%S+-<++>]'<Enter>0v$h"dd"_dd?<++><Enter>v3l"dpa<Space><++><Esc>2?<++><Enter>"_c4l
inoremap ;d <++><Esc>:r !date '+\%Y\%m\%d'<Enter>0v$h"dd"_dd?<++><Enter>v3l"dpa
inoremap ;dc <++><Esc>:r !date '+\%d/\%m/\%Y'<Enter>0v$h"dd"_dd?<++><Enter>v3l"dpa

" goyo plugin
"   center writing
map <leader>c :Goyo \| set linebreak<CR>
