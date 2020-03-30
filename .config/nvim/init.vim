" nvimrc (neovim configuration file)

let g:VIM_PATH=expand('$XDG_CONFIG_HOME/nvim')

" --- plugin management --- "
call plug#begin('$XDG_CONFIG_HOME/nvim/plugged')
    " essential
    Plug 'unblevable/quick-scope'                   " find that word
    Plug 'dense-analysis/ale'                       " syntax checking
    Plug 'neoclide/coc.nvim', {'branch': 'release'} " intelligent completion
    Plug 'christoomey/vim-tmux-navigator'           " tmux navigation
    "Plug 'Raimondi/delimitMate'                     " closing brackets
    Plug 'tpope/vim-surround'                       " changing brackets
    Plug 'ctrlpvim/ctrlp.vim'                       " file fuzyfinder
    Plug 'scrooloose/nerdcommenter'                 " (un)comments text
    Plug 'norcalli/nvim-colorizer.lua'              " colors become colored
    Plug 'terryma/vim-expand-region'                " expanding selection

    " HTML
    Plug 'mattn/emmet-vim'  " easy html typing

    " NERDTree
    Plug 'scrooloose/nerdtree'                      " file system explorer
    Plug 'Xuyuanp/nerdtree-git-plugin'              " NERDTree git marks
    Plug 'ryanoasis/vim-devicons'                   " file icons on NERDTree
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight'  " highlights filetypes

    " focused writing
    Plug 'junegunn/goyo.vim'        " center text
    Plug 'junegunn/limelight.vim'   " focused writing

    Plug 'VebbNix/lf-vim'                         " lfrc syntax and highlighting
call plug#end()


" --- general settings --- "
" aesthetics
colorscheme wal
"colorscheme default
" line numbering
set number relativenumber
" highlighting searches
set hlsearch
" not redrawing screen while running macros
set lazyredraw
" tab completion in command line
set wildmenu
set wildmode=list:longest,full
" using case insensitive on searches (not good...)
"set ic
" mouse selection in VIM
set mouse=a
" making a link between OS' and VIM's clipboard space (+ or *)
"   something with unnamed or unnamedplus
set clipboard=unnamedplus
" making backups and undofiles (make sure the directory exists)
set dir=~/.cache/vim/swap//
set undodir=~/.cache/vim/undo//
set backupdir=~/.cache/vim//
set backup
set undofile
" spelling
"   enabling dictionary search when spell is on
set complete+=kspell


" --- loading scripts --- "
exec "source " .  g:VIM_PATH . "/init/scripts.vim"
" --- loading automation settings --- "
exec "source " .  g:VIM_PATH . "/init/automation.vim"
" --- plugin settings --- "
exec "source " .  g:VIM_PATH . "/init/plugins.vim"
" --- abbreviations --- "
exec "source " .  g:VIM_PATH . "/init/abbreviations.vim"


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
