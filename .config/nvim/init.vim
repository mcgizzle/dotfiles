syntax on
filetype plugin indent on

set nocompatible
set number
set showmode
set smartcase
set smarttab
set smartindent
set autoindent
set expandtab
set shiftwidth=2
set softtabstop=2
set laststatus=0

execute pathogen#infect()

call neomake#configure#automake('w')
" Key Bindings
" Intero Maps
tnoremap <Esc> <C-\><C-n>
" Lookup the type of expression under the cursor
au FileType haskell nmap <silent> <leader>t <Plug>InteroGenericType
au FileType haskell nmap <silent> <leader>T <Plug>InteroType
" Insert type declaration
au FileType haskell nnoremap <silent> <leader>nt :InteroTypeInsert<CR>
" Show info about expression or type under the cursor
au FileType haskell nnoremap <silent> <leader>ni :InteroInfo<CR>

" Open/Close the Intero terminal window
au FileType haskell nnoremap <silent> <leader>nn :InteroOpen<CR>
au FileType haskell nnoremap <silent> <leader>nh :InteroHide<CR>

" Reload the current file into REPL
au FileType haskell nnoremap <silent> <leader>nf :InteroLoadCurrentFile<CR>
" Jump to the definition of an identifier
au FileType haskell nnoremap <silent> <leader>ng :InteroGoToDef<CR>
" Evaluate an expression in REPL
au FileType haskell nnoremap <silent> <leader>ne :InteroEval<CR>

" Start/Stop Intero
au FileType haskell nnoremap <silent> <leader>ns :InteroStart<CR>
au FileType haskell nnoremap <silent> <leader>nk :InteroKill<CR>
" NerdTree Ctrl-e
map <C-e> :NERDTreeToggle<CR>

" Deoplete
let g:deoplete#enable_at_startup = 1
" Use smartcase.
let g:deoplete#enable_smart_case = 1
"let g:haskellmode_completion_ghc = 0
let g:haskell_classic_highlighting = 1
"let g:haskell_indent_disable = 1
let NERDTreeShowHidden=1

" Intero
" Reload on start
"au BufWritePost *.hs InteroReload

" Haskell Config
au BufNewFile,BufRead *.hs
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set expandtab |
    \ set autoindent |
    \ set nu 


