"
" vimrc --- Vim configuration file.
"
" Copyright (C) 2001-2013, James Bielman <jamesjb@gmail.com>
" All Rights Reserved.
"

" Source a file if it exists.
function! SourceIfExists(file)
    if filereadable(expand(a:file))
        exe 'source' a:file
    endif
endfunction

set ts=4
set sw=4
set et
set autoindent
set nocindent
set nosmartindent
set indentexpr=
set showmatch
set modeline
set nohlsearch
set backspace=2
set nu
set ruler
set visualbell

syntax on

filetype indent off
filetype plugin indent off

if has('win32')
    set guifont=Consolas:h12
endif

if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

set guicursor+=a:blinkon0
set guioptions-=m
set guioptions-=T
set guioptions-=r
set guioptions-=L

set pastetoggle=<F2>
imap jk <Esc>

call plug#begin('~/.vim/plugged')
Plug 'ctrlpvim/ctrlp.vim'
Plug 'sonph/onehalf', { 'rtp': 'vim' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call SourceIfExists("~/.vimrc_plugins.local")
call plug#end()

colorscheme onehalfdark

let g:ctrlp_working_path_mode = 'a'

let g:airline_powerline_fonts = 1
let g:airline_theme = 'onehalfdark'

let mapleader=","
nnoremap <Leader>b :CtrlPBuffer<CR>

let maplocalleader = "\\"

call SourceIfExists("~/.vimrc.local")
