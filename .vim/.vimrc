""" VimPlug setup

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')
  " lsp
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  " which-key
  Plug 'liuchengxu/vim-which-key'
  " colorscheme
  Plug 'morhetz/gruvbox'
  " useful plugins
  Plug 'tpope/vim-surround'
  Plug 'vim-airline/vim-airline'
  Plug 'scrooloose/nerdcommenter'
  Plug 'kien/ctrlp.vim'
  Plug 'jiangmiao/auto-pairs'
call plug#end()

""" lsp setup (extracted from neoclide/coc.nvim)

set hidden

set nobackup
set nowritebackup

set updatetime=300

set shortmess+=c

set signcolumn=yes

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

""" colorscheme setup

set background=dark
colorscheme gruvbox

""" vim-which-key setup

" I'm going to put some useful keybindings and commands in this section as
" well

" use space as leader key
let g:mapleader = " "
nnoremap <SPACE> <Nop>
" use \ as local leader key
let g:maplocalleader = "\\"
nnoremap \ <Nop>

" pressing jk in insert mode is equivalent to pressing esc
inoremap jk <esc>

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

" jk puts terminal into normal mode
tnoremap jk <C-W>N
let g:which_key_map.t = ['terminal', 'terminal']
let g:which_key_map.q = ['quit', 'quit']

" :W sudo saves the file 
" (useful for handling the permission-denied error)
command W w !sudo tee % > /dev/null

let g:which_key_map.c = {'name' : '+comment'}

let g:which_key_map.f = {
      \ 'name' : '+file',
      \ 's' : ['update'          , 'save-file']   ,
      \ 'S' : [':W'          , 'save-sudo']   ,
      \ 'v' : [':e $MYVIMRC' , 'open-vimrc']   ,
      \ 'o' : ['CtrlP' , 'open']   ,
      \ }

let g:which_key_map.b = {
      \ 'name' : '+buffer' ,
      \ 'd' : ['bd'        , 'delete-buffer']   ,
      \ 'j' : ['bnext'     , 'next-buffer']     ,
      \ 'k' : ['bprevious' , 'previous-buffer'] ,
      \ 'l' : ['ls' , 'list'] ,
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
