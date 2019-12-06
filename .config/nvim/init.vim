" nvimrc (neovim configuration file)

" --- plugin management --- "
call plug#begin('~/.vim/plugged')
    " essential
    Plug 'vim-syntastic/syntastic'                  " syntax checking
    Plug 'neoclide/coc.nvim', {'branch': 'release'} " intelligent completion
    Plug 'ctrlpvim/ctrlp.vim'                       " file fuzyfinder
    Plug 'scrooloose/nerdcommenter'                 " (un)comments text

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
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!


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
" remaping window moviment in i3 way
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
" remove these and add https://github.com/christoomey/vim-tmux-navigator

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

