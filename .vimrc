set autoindent
set tabstop=4
set showmatch
set number
syntax on

"key mappings
nnoremap [Tag] <Nop>
nmap t [Tag]
nnoremap [Tag]n : tabnext<CR> 
nnoremap [Tag]p : tabprevious<CR> 
nnoremap [Tag]o : tabe 
nnoremap [Tag]x : tabclose<CR> 
