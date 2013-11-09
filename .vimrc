set autoindent
set tabstop=4
set showmatch
set number
syntax on

"start for vundle

set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

"orignal repos on github
Bundle "Shougo/neocomplcache"

"vim-scripts repos

"non github repos

filetype plugin indent on

"end for vundle
