set number
set relativenumber
set hlsearch
set cursorline
set wildmenu
set wrap
set showcmd
set autoindent
set tabstop=2
set shiftwidth=2
set expandtab
set smarttab
set cindent
set ignorecase
inoremap ( ()<ESC>i
inoremap {<CR> {<CR>}<ESC>O<tab>
inoremap [ []<ESC>i
inoremap kj <ESC>
inoremap K 5k
inoremap J 5j
inoremap H 5h
inoremap L 5l
call plug#begin()
Plug 'ycm-core/YouCompleteMe'
Plug 'vim-airline/vim-airline'
Plug 'connorholyday/vim-snazzy'
call plug#end()
color snazzy
let g:SnazzyTransparent = 1
