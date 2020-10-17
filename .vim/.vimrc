" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')
  " lsp
  Plug 'prabirshrestha/vim-lsp'
  Plug 'mattn/vim-lsp-settings'
  " autocomplete
  Plug 'prabirshrestha/asyncomplete.vim'
  Plug 'prabirshrestha/asyncomplete-lsp.vim'
  " which-key
  Plug 'liuchengxu/vim-which-key'
  " colorscheme
  Plug 'tomasr/molokai'
call plug#end()

colorscheme molokai

let g:mapleader = " "
nnoremap <SPACE> <Nop>
let g:maplocalleader = "\\"
nnoremap \ <Nop>

nnoremap <silent> <leader> :<c-u>WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>

call which_key#register('<Space>', "g:which_key_map")

let g:which_key_map =  {}

let g:which_key_map.f = {
      \ 'name' : '+file',
      \ 's' : ['update'          , 'save-file']   ,
      \ 'd' : [':e $MYVIMRC' , 'open-vimrc']   ,
      \ }

nnoremap <silent> <leader>oq  :copen<CR>
nnoremap <silent> <leader>ol  :lopen<CR>
let g:which_key_map.o = {
      \ 'name' : '+open',
      \ 'q' : 'open-quickfix'    ,
      \ 'l' : 'open-locationlist',
      \ }

let g:which_key_map.b = {
      \ 'name' : '+buffer' ,
      \ 'd' : ['bd'        , 'delete-buffer']   ,
      \ 'j' : ['bnext'     , 'next-buffer']     ,
      \ 'k' : ['bprevious' , 'previous-buffer'] ,
      \ }
