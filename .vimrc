set nocompatible
set backspace=start,eol,indent
set mouse=
set tabstop=4
set indentkeys=""
set showmatch
set showcmd
set number
syntax on
set nohlsearch
set laststatus=2
set incsearch
set ignorecase
set wildmenu wildmode=list:full
set vb t_vb=

"key mappings
nnoremap [Tag] <Nop>
nmap t [Tag]
nnoremap [Tag]n : tabnext<CR>
nnoremap [Tag]p : tabprevious<CR>
nnoremap [Tag]o : tabe 
nnoremap [Tag]x : tabclose<CR> 

"neobundle settings

if has('vim_starting')
	set runtimepath+=~/.vim/bundle/neobundle.vim
endif

"initialize
call neobundle#rc(expand('~/.vim/bundle'))

"update
NeoBundleFetch 'Shougo/neobundle.vim'

"plugins
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'Townk/vim-autoclose'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'grep.vim'
NeoBundle 'alpaca-tc/vim-endwise.git'

filetype plugin indent on

NeoBundleCheck

"end neobundle settings
