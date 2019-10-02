" nvimrc (neovim configuration file)

" --- plugin management --- "
call plug#begin('~/.vim/plugged')
    Plug 'vim-syntastic/syntastic'  " syntax checker
    Plug 'junegunn/goyo.vim'        " center text
    Plug 'junegunn/limelight.vim'   " focused writing
    Plug 'vifm/neovim-vifm'         " vifm
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


" --- automation --- "
" editing from where you were
au BufReadPost * if line("'\"") > 0 | if line("'\"") <= line("$") | exe("norm '\"") | else | exe "norm $" | endif | endif
" fold based on indent level and manual choices
augroup vimrc
  au BufReadPre * setlocal foldmethod=indent
  au BufWinEnter * if &fdm == 'indent' | setlocal foldmethod=manual | endif
augroup END
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
" file browsing with netrw
let g:netrw_banner=0
let g:netrw_browse_split=4
let g:netrw_altv=1
let g:netrw_liststyle=3
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)zs\.\S\+'
" automating limelight plugin to follow goyo
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!


" --- dictionaries --- "
ab abc abcdefghijklmnopqrstuvwxyz


" --- mappings --- "
" setting leader
let mapleader=" "

" -- splitscreens -- "
" splitting in i3 way
set splitbelow splitright
" remaping window moviment in i3 way
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

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
vnoremap s( <Esc>`>a)<Esc>`<i(<Esc><C-o>
vnoremap s[ <Esc>`>a]<Esc>`<i[<Esc><C-o>
vnoremap s{ <Esc>`>a}<Esc>`<i{<Esc><C-o>
vnoremap s< <Esc>`>a><Esc>`<i<<Esc><C-o>
vnoremap s" <Esc>`>a"<Esc>`<i"<Esc><C-o>
vnoremap s' <Esc>`>a'<Esc>`<i'<Esc><C-o>


" -- date stuff -- "
inoremap ;df <++><Esc>:r !date '+\%Y\%m\%d\%H\%M\%S'<Enter>0v$h"dd"_dd?<++><Enter>v3l"dpa
inoremap ;dl <++><Esc>:r !date '+[\%Y\%m\%d\%H\%M\%S+-<++>]'<Enter>0v$h"dd"_dd?<++><Enter>v3l"dpa<Space><++><Esc>2?<++><Enter>"_c4l
inoremap ;d <++><Esc>:r !date '+\%Y\%m\%d'<Enter>0v$h"dd"_dd?<++><Enter>v3l"dpa
inoremap ;dc <++><Esc>:r !date '+\%d/\%m/\%Y'<Enter>0v$h"dd"_dd?<++><Enter>v3l"dpa

" goyo plugin
"   center writing
map <leader>c :Goyo \| set linebreak<CR>

