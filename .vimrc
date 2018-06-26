"searching
set ignorecase
set incsearch
set hlsearch

"editing 
set nocompatible
set shiftround
set infercase
set encoding=utf-8
"set virtualedit=all
set backspace=start,eol,indent
set mouse=
set expandtab
set tabstop=4
set shiftwidth=4
set textwidth=0
"set colorcolumn=80
set indentkeys=""
set showmatch
syntax on
set laststatus=2
set wildmenu wildmode=list:full
set matchpairs& matchpairs+=<:>

"no backup files
set nowritebackup
set nobackup
set noswapfile

"display
"set list
set vb t_vb=
set novisualbell
set number
set showcmd
set belloff=all

"key mappings

"gtags
map <C-h> :Gtags -f %<CR>
map <C-j> :GtagsCursor<CR>
map <C-n> :cn<CR>
map <C-p> :cp<CR>

"tab
nnoremap [Tag] <Nop>
nmap t [Tag]
nnoremap [Tag]n : tabnext<CR>
nnoremap [Tag]p : tabprevious<CR>
nnoremap [Tag]o : tabe 
nnoremap [Tag]x : tabclose<CR>
"jump
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz
nnoremap <S-Left>  <C-w><<CR>
nnoremap <S-Right> <C-w>><CR>
nnoremap <S-Up>    <C-w>-<CR>
nnoremap <S-Down>  <C-w>+<CR>

"neobundle settings

if has('vim_starting')
	set runtimepath+=~/.vim/bundle/neobundle.vim
endif

"initialize
call neobundle#begin(expand('~/.vim/bundle'))
"update
NeoBundleFetch 'Shougo/neobundle.vim'
call neobundle#end()

"plugins
"NeoBundle 'scrooloose/nerdtree'

NeoBundle "tpope/vim-fugitive.git"
NeoBundle 'Townk/vim-autoclose'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'grep.vim'
NeoBundle 'alpaca-tc/vim-endwise.git'
NeoBundle 'Shougo/unite.vim'

NeoBundle 'leafgarland/typescript-vim'
let g:syntastic_typescript_tsc_args = "--experimentalDecorators --target ES5"

NeoBundle 'Shougo/vimproc', {
  \ "build" : {
    \ "cygwin" : "make -f make_cygwin.mak",
    \ "mac" : "make -f make_mac.mak",
    \ "unix" : "make -f make_unix.mak",
  \ },
\ }

NeoBundleLazy 'Shougo/vimfiler', {
  \ "depends": ["Shougo/unite.vim"],
  \ "autoload": {
  \   "commands": ["VimFilerTab", "VimFiler", "VimFilerExplorer"],
  \   "mapping": ['<Plug>(vimfiler_switch)'],
  \   "explorer": 1,
  \ }}
nnoremap [Explorer] <Nop>
nmap <Leader> [Explorer]
nnoremap <Leader>e : VimFilerExplorer<CR>

NeoBundleLazy 'Shougo/neocomplete.vim', {
\  "autoload": {
\    "insert": 1,
\}}
let g:neocomplete#enable_at_startup = 1

filetype plugin indent on

NeoBundleCheck

"end neobundle settings
