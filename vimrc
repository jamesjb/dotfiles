"
" vimrc --- Vim configuration file.
"
" Copyright (C) 2001-2013, James Bielman <jamesjb@gmail.com>
" All Rights Reserved.
"

syntax on
colors elflord
set ts=2
set sw=2
set et
set autoindent
set nocindent
set nosmartindent
set indentexpr=
set showmatch
set modeline
filetype indent off
filetype plugin indent off

set pastetoggle=<F2>
imap jk <Esc>

call plug#begin('~/.vim/plugged')
Plug 'ctrlpvim/ctrlp.vim'
call plug#end()

let g:ctrlp_working_path_mode = 'a'

let mapleader=","
nnoremap <Leader>b :CtrlPBuffer<CR>
