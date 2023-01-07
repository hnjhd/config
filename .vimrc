
"       _                        
"__   _(_)_ __ ___      _ __ ___ 
"\ \ / / | '_ ` _ \    | '__/ __|
" \ V /| | | | | | |   | | | (__ 
"  \_/ |_|_| |_| |_|___|_|  \___|
"                 |_____|        
let mapleader=" "
syntax on
syntax enable
set nocompatible
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on
set encoding=utf-8
set relativenumber
set number
set hlsearch
set cursorline "show a line on where you are
set wildmenu "use <tab> to finish you cmd
set wrap "字不会超出当前位置
set showcmd 
set hlsearch "Highlight
exec "nohlsearch"
set incsearch "highlight when input
set autoindent
set tabstop=2
set shiftwidth=2
set expandtab
set smarttab
set cindent
set ignorecase
set smartcase
set scrolloff=5 " 剩余5行在最下面
let &t_8f= "\<Esc>[38;2;%lu;%lu;%lum"       " set foreground color
let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"        " set background color
"colorscheme Tomorrow-Night-Eighties
set t_Co=256                         " Enable 256 colors
set termguicolors                    " Enable GUI colors for the terminal to get truecolor]]]]

map tx :r !figlet

"set mouse
" quick move
noremap K 5k
noremap J 5j
noremap H 5h
noremap L 5l
noremap <LEADER><CR> :nohlsearch<CR>

map s <nop>
map sl :set nosplitright<CR>:vsplit<CR>
map sh :set splitright<CR>:vsplit<CR>
map sj :set splitbelow<CR>:split<CR>
map sk :set nosplitbelow<CR>:split<CR>
map sn <C-w>t<C-w>H
map sm <C-w>t<C-w>K

map <LEADER>l <C-w>l
map <LEADER>h <C-w>h
map <LEADER>j <C-w>j
map <LEADER>k <C-w>k

map <up> :res +5<CR>
map <down> :res -5<CR>
map <left> :vertical resize -5<CR>
map <right> :vertical resize +5<CR>

map tu :tabe<CR>
map tn :-tabnext<CR>
map tm :+tabnext<CR>

inoremap ( ()<ESC>i
inoremap {<CR> {<CR>}<ESC>O<tab>
inoremap [ []<ESC>i
inoremap kj <ESC>

map R :source $MYVIMRC<CR>

map r :call CompileRunGcc()<CR>
func! CompileRunGcc()
  exec "w"
  if &filetype == 'cpp'
    exec "!g++ % -o %<"
    exec "!time ./%<"
  elseif &filetype == 'html'
    exec "!firefox % &"
  elseif &filetype == 'markdown'
    exec "MarkdownPreview"
  endif
endfunc
" plug
call plug#begin()
Plug 'vim-airline/vim-airline'
Plug 'connorholyday/vim-snazzy'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-surround'
Plug 'gcmt/wildfire.vim'
Plug 'iamcco/markdown-preview.vim'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'lervag/vimtex'
Plug 'KeitaNakamura/tex-conceal.vim', {'for': 'tex'}
Plug 'wjakob/wjakob.vim'
call plug#end()

color snazzy

" ===
" === latex 
" ===
let g:tex_flavor='latex'
"let g:vimtex_view_method='zathura'
let g:vimtex_view_general_viewer = 'okular'
let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'

let g:vimtex_quickfix_mode=0

" 对中文的支持
let g:Tex_CompileRule_pdf = 'xelatex -synctex=1 --interaction=nonstopmode $*'
let g:vimtex_compiler_latexmk_engines = {'_':'-xelatex'}
let g:vimtex_compiler_latexrun_engines ={'_':'xelatex'}

"set conceallevel=2   
"let g:tex_conceal='abdmg'
"
"autocmd Filetype tex setl updatetime=1
" ===
" === leetcode
" ===
let g:leetcode_china=1
let g:leetcode_browser='firefox'

" ===
" === Snazzy
" ===

let g:SnazzyTransparent = 1

" ===
" === UltiSnips
" ===
let g:UltiSnipsExpandTrigger="<c-n>"
let g:UltiSnipsJumpForwardTrigger="<c-k>"
let g:UltiSnipsJumpBackwardTrigger="<c-j>"
let g:UltiSnipsSnippetDirectories = [$HOME.'/.config/vim/Ultisnips/']
" ===
" === markdown-preview
" ===
let g:mkdp_browser = 'firefox'
" ===
" === coc.nvim
" ===
 set updatetime=50
set shortmess+=c
 let g:coc_global_extensions = ['coc-clangd']
 inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1):
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> <LEADER>+ <Plug>(coc-diagnostic-prev)
nmap <silent> <LEADER>- <Plug>(coc-diagnostic-next)

" Highlight the symbol and its references when holding the cursor.

