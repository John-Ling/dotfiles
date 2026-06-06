set nocompatible
filetype on
filetype plugin on
filetype indent on
syntax on
set number
set shiftwidth=4
set tabstop=4
set expandtab
set nobackup
set nowrap
set hlsearch
set showmatch
set relativenumber
autocmd TextYankPost * call system('wl-copy', join(v:event.regcontents, "\n"))
