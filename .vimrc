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
set mouse
inoremap ( ()<ESC>i
inoremap {<CR> {<CR>}<ESC>O<tab>
inoremap [ []<ESC>i
inoremap kj <ESC>
" plug
call plug#begin()
Plug 'vim-airline/vim-airline'
Plug 'connorholyday/vim-snazzy'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-surround'
Plug 'gcmt/wildfire.vim'
Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}
Plug 'iamcco/markdown-preview.vim'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
call plug#end()

color snazzy

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
let g:mkdp_browser = 'Firefox'
" ===
" === coc.nvim
" ===
 set updatetime=50
set shortmess+=c
 let g:coc_global_extensions = ['coc-clangd', 'coc-jedi']
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
nmap <silent> <LEADER>j <Plug>(coc-diagnostic-prev)
nmap <silent> <LEADER>k <Plug>(coc-diagnostic-next)

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')
