 "warns about absence of nodejs
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

let g:ale_disable_lsp = 1

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')
" lsp
Plug 'dense-analysis/ale'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
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
" coc-json is useful for editing coc-settings.json
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

" jk or kj puts terminal into normal mode
tnoremap jk <C-W>N
tnoremap kj <C-W>N

" fast navegation
nnoremap K {
nnoremap J }
nnoremap H ^
nnoremap L $

" easy macro execution (record it with qq)
nnoremap Q @q
vnoremap Q :norm @q<CR>

" maps s to search
nnoremap s /

" maps <esc> to clear search highlightings
nnoremap <esc><esc> :noh<CR>

" makes Y consistent with C and D, since original Y behavior is equivalent to yy
nnoremap Y y$

" makes zz alternate current line screen position among center, bottom and top
" of screen

let s:next_screen_line_position = 0
function s:reposition_screen_line()
    if (s:next_screen_line_position == 0)
        let s:next_screen_line_position = 1
        normal z.
    elseif (s:next_screen_line_position == 1)
        let s:next_screen_line_position = 2
        normal zt
    else
        let s:next_screen_line_position = 0
        normal z-
    endif
endfunction
command -nargs=0 RepositionScreenLine :call s:reposition_screen_line()

nnoremap zz :RepositionScreenLine<CR>

nnoremap <silent> <leader> :<c-u>WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  '\'<CR>

call which_key#register('<Space>', "g:which_key_map")

let g:which_key_map = {}
let g:which_key_map.x= [':Commands', 'commands']

let g:which_key_map.b = {
                  \ 'name' : '+buffer' ,
                  \ 'b' : ['Buffers'        , 'buffers']   ,
                  \ 'd' : ['bd'        , 'delete-buffer']   ,
                  \ 'D' : [':bd!'        , 'force-delete-buffer']   ,
                  \ 'j' : ['bnext'     , 'next-buffer']     ,
                  \ 'l' : ['<C-^>' , 'last-buffer'] ,
                  \ 'k' : ['bprevious' , 'previous-buffer'] ,
                  \ }

let g:which_key_map.c = {'name' : '+comment'}

" :W sudo saves the file 
" (useful for handling the permission-denied error)
command W w !sudo tee % > /dev/null

let g:which_key_map.f = {
                  \ 'name' : '+file',
                  \ 's' : ['update'          , 'save-file']   ,
                  \ 'S' : [':W'          , 'save-sudo']   ,
                  \ 'v' : [':e $MYVIMRC' , 'open-vimrc']   ,
                  \ 'f' : ['Files', 'find']   ,
                  \ 'p' : ['GFiles', 'project-find']   ,
                  \ 'o' : ['NERDTreeToggle' , 'open']   ,
                  \ 'r' : ['History' , 'recent']   ,
                  \ }

let g:which_key_map.g = {
                  \ 'name' : '+go',
                  \ 'l' : ['BLines', 'buffer-line'],
                  \ 'L' : ['Lines', 'any-line'],
                  \ }

let g:which_key_map.l = {
                  \ 'name' : '+lsp',
                  \ 'a' : ['<Plug>(coc-codeaction-line)', 'actions'],
                  \ 'd' : ['<Plug>(coc-definition)', 'definition'],
                  \ 'e' : ['<Plug>(coc-diagnostic-next)', 'next-error'],
                  \ 'E' : ['<Plug>(coc-diagnostic-prev)', 'previous-error'],
                  \ 'f' : ['<Plug>(coc-fix-current)', 'fix'],
                  \ 'i' : ['<Plug>(coc-implementation)', 'implementation'],
                  \ 'I' : ['OrganizeImports', 'organize-imports'],
                  \ 'r' : ['<Plug>(coc-references)', 'references'],
                  \ 'R' : ['<Plug>(coc-rename)', 'symbol-rename'],
                  \ 't' : ['<Plug>(coc-type-definition)', 'type-definition'],
                  \ }
command! -nargs=0 OrganizeImports :call CocAction('runCommand', 'editor.action.organizeImport')

let g:which_key_map.s = {
                  \ 'name' : '+session',
                  \ 'w' : ['<Plug>WriteSession', 'write-session'],
                  \ 'l' : ['<Plug>LoadSession', 'load-session'],
                  \ }
nnoremap <Plug>WriteSession :mksession<space>
nnoremap <Plug>LoadSession :source<space>

let g:which_key_map.v = {
                  \ 'name' : '+version-control',
                  \ 'b' : ['GitBlame', 'blame'],
                  \ 'c' : [':BCommits', 'any-commits'],
                  \ 'C' : [':Commits', 'any-commits'],
                  \ 'd' : ['GitDiff', 'diff'],
                  \ 'g' : ['<Plug>Git', 'git'],
                  \ 'l' : ['GitLog', 'log'],
                  \ 's' : ['GitStatus', 'status'],
                  \ }
nnoremap <Plug>Git :Git<space>
command! -nargs=0 GitStatus :normal :Git status<cr>
command! -nargs=0 GitDiff :normal :Git diff<cr>
command! -nargs=0 GitLog :normal :Git log<cr>
command! -nargs=0 GitBlame :normal :Git blame<cr>

runtime ftplugin/man.vim

function! s:show_documentation()
      if (index(['vim','help'], &filetype) >= 0)
            execute 'h '.expand('<cword>')
      elseif (coc#rpc#ready())
            call CocActionAsync('doHover')
      else
            execute '!' . &keywordprg . " " . expand('<cword>')
      endif
endfunction

function! s:show_man()
      execute 'Man '.expand('<cword>')
endfunction

" Is there a better way to do this?
let g:which_key_map.h = {
                  \ 'name' : '+help',
                  \ 'd' : ['ShowDoc', 'documentation'],
                  \ 'm' : ['ShowMan', 'man'],
                  \ 'v' : ['help', 'vim-help'],
                  \ }
command! -nargs=0 ShowMan :call <SID>show_man()<CR>
command! -nargs=0 ShowDoc :call <SID>show_documentation()<CR>

let g:which_key_map.p = {
                  \ 'name' : '+program',
                  \ 'b' : ['<Plug>Build', 'build'],
                  \ 'E' : ['cprev', 'previous-error'],
                  \ 'e' : ['cnext', 'next-error'],
                  \ 'l' : ['copen', 'list-errors'],
                  \ }
nnoremap <Plug>Build :make<space>

let g:which_key_map.q = [':q', 'quit']
let g:which_key_map.Q = [':q!', 'force-quit']
let g:which_key_map.t = ['terminal', 'terminal']
let g:which_key_map.r = ['q:', 'run-from-history']

let g:which_key_map.T = {
                  \ 'name' : '+text',
                  \ 'r' : ['<Plug>(coc-rename)', 'rename'],
                  \ 'f' : ['Format', 'format'],
                  \ 'i' : ['<Plug>Indent', 'indent'],
                  \ 'z' : ['Fold', 'zip'],
                  \ 'o' : ['za', 'open'],
                  \ 'w' : [':%s/\s\+$//', 'trim-whitespaces-at-end'],
                  \ }
nnoremap <Plug>Indent =
command! -nargs=0 Format :call CocAction('format')
command! -nargs=? Fold :call CocAction('fold', <f-args>)

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
                  \ 'H' : ['<C-w>H', 'move-left'],
                  \ 'L' : ['<C-w>L', 'move-right'],
                  \ 'J' : ['<C-w>J', 'move-below'],
                  \ 'K' : ['<C-w>K', 'move-above'],
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
set number relativenumber

" highlits current line
set cursorline 

" automatically change current working directory
set autochdir

" always ask for confirmation
set confirm
