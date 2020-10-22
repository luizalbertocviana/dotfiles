" warns about absence of nodejs
if !executable('node')
      echo "node is not in your PATH. This vimrc is heavily dependent on it"
      quit
endif

""" VimPlug setup

" this automatically installs VimPlug and the listed plugins
" if you add more plugins after first run, use :PlugInstall
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')
  " lsp
  if executable('node')
      Plug 'neoclide/coc.nvim', {'branch': 'release'}
  endif
  " which-key
  Plug 'liuchengxu/vim-which-key'
  " colorscheme
  Plug 'NLKNguyen/papercolor-theme'
  " git integration
  Plug 'tpope/vim-fugitive'
  " useful plugins
  Plug 'tpope/vim-surround'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'itchyny/lightline.vim'
  Plug 'scrooloose/nerdcommenter'
  Plug 'jiangmiao/auto-pairs'
  Plug 'preservim/nerdtree'
  Plug 'sheerun/vim-polyglot'
call plug#end()

""" lightline setup

set noshowmode

""" lsp setup (extracted from neoclide/coc.nvim)

" add extensions you want to be automatically installed
" use :CocList marketplace to discover new extensions
let g:coc_global_extensions = [
      \ "coc-marketplace",
      \ "coc-json",
      \ "coc-rust-analyzer",
      \ "coc-clangd"
      \ ]

set hidden

set nobackup
set nowritebackup

set updatetime=300

set shortmess+=c

set signcolumn=yes

""" colorscheme setup

set background=dark
colorscheme PaperColor

""" vim-which-key setup

" I'm going to put some useful keybindings and commands in this section as
" well

" use space as leader key
let g:mapleader = " "
nnoremap <SPACE> <Nop>
" use \ as local leader key
let g:maplocalleader = "\\"
nnoremap \ <Nop>

" pressing jk or kj in insert mode is equivalent to pressing esc
inoremap jk <esc>
inoremap kj <esc>

" fast navegation
nnoremap K {
nnoremap J }
nnoremap H ^
nnoremap L $

" makes Y consistent with C and D, since original Y behavior is equivalent to yy
nnoremap Y y$

nnoremap <silent> <leader> :<c-u>WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  '\'<CR>

call which_key#register('<Space>', "g:which_key_map")

let g:which_key_map = {}

" jk or kj puts terminal into normal mode
tnoremap jk <C-W>N
tnoremap kj <C-W>N
let g:which_key_map.t = ['terminal', 'terminal']
let g:which_key_map.q = [':q', 'quit']
let g:which_key_map.Q = [':q!', 'force-quit']

" :W sudo saves the file 
" (useful for handling the permission-denied error)
command W w !sudo tee % > /dev/null

let g:which_key_map.c = {'name' : '+comment'}

let g:which_key_map.f = {
      \ 'name' : '+file',
      \ 's' : ['update'          , 'save-file']   ,
      \ 'S' : [':W'          , 'save-sudo']   ,
      \ 'v' : [':e $MYVIMRC' , 'open-vimrc']   ,
      \ 'f' : ['Files', 'find']   ,
      \ 'o' : ['NERDTreeToggle' , 'open']   ,
      \ 'r' : ['History' , 'recent']   ,
      \ }

let g:which_key_map.b = {
      \ 'name' : '+buffer' ,
      \ 'b' : ['Buffers'        , 'buffers']   ,
      \ 'd' : ['bd'        , 'delete-buffer']   ,
      \ 'D' : [':bd!'        , 'force-delete-buffer']   ,
      \ 'j' : ['bnext'     , 'next-buffer']     ,
      \ 'l' : ['<C-^>' , 'last-buffer'] ,
      \ 'k' : ['bprevious' , 'previous-buffer'] ,
      \ }

let g:which_key_map.w = {
    \ 'name' : '+windows',        
    \ 's' : ['sp', 'split'],        
    \ 'v' : ['vsp', 'vertical-split'],        
    \ 'w' : ['<C-w>w', 'switch-windows'],        
    \ 'd' : ['<C-w>q', 'close-windows'],        
    \ 'h' : ['<C-w>h', 'left-window'],        
    \ 'l' : ['<C-w>l', 'right-window'],        
    \ 'j' : ['<C-w>j', 'below-window'],        
    \ 'k' : ['<C-w>k', 'above-window'],        
    \ 'm' : ['<C-w>o', 'maximize'],        
    \ }

""" a lot of options

" Sets how many lines of history VIM has to remember
set history=500

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" Turn on the Wild menu
set wildmenu

" Always show current position
set ruler

" Height of the command bar
set cmdheight=2

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases 
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch 

" Don't redraw while executing macros (good performance config)
set lazyredraw 

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch 
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Add a bit extra margin to the left
set foldcolumn=1

" Enable syntax highlighting
syntax enable 

" Set utf8 as standard encoding
set encoding=utf8

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

" Always show the status line
set laststatus=2

" persistent undo
try
    set undodir=~/.vim/temp_dirs/undodir
    set undofile
catch
endtry

" shows number of lines
set number 

" highlits current line
set cursorline 

" automatically change current working directory
set autochdir
