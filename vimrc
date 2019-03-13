"
" vimrc --- Vim configuration file.
"
" Copyright (C) 2001-2013, James Bielman <jamesjb@gmail.com>
" All Rights Reserved.
"

syntax on
colors elflord
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
filetype indent off
filetype plugin indent off

" set list
" set listchars=eol:⏎,tab:␉·,trail:␠,nbsp:⎵
set listchars=tab:␉·,trail:␠,nbsp:⎵

set pastetoggle=<F2>
imap jk <Esc>

call plug#begin('~/.vim/plugged')
Plug 'ctrlpvim/ctrlp.vim'
Plug 'leafgarland/typescript-vim'
Plug 'fatih/vim-go'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

let g:ctrlp_working_path_mode = 'a'

let g:airline_powerline_fonts = 1
let g:airline_theme = 'bubblegum'

let mapleader=","
nnoremap <Leader>b :CtrlPBuffer<CR>

let maplocalleader = "\\"

autocmd FileType go nmap <LocalLeader>b <Plug>(go-build)
autocmd FileType go nmap <LocalLeader>r <Plug>(go-run)
autocmd FileType go nmap <LocalLeader>i <Plug>(go-imports)
