execute pathogen#infect()
syntax on
filetype indent on
filetype plugin indent on
set expandtab
set tabstop=2 
set softtabstop=2 
set backspace=indent,eol,start
set shiftwidth=2
set nu

" Key Bindings
map <Leader>q" ciw""<Esc>P
map <Leader>qd daW"=substitute(@@,"'\\\|\"","","g")<CR>P
map <Leader>q' ciw''<Esc>P
map <C-e> :NERDTreeToggle<CR>

" Haskell Config
let g:haskell_classic_highlighting = 1
"let g:stylish_haskell_command = 0
let g:haskell_indent_disable = 1 

au BufNewFile,BufRead *.sh
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set nu 

au BufNewFile,BufRead *.hs
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set expandtab |
    \ set autoindent |
    \ set nu 

" Python Config
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set nu |
    \ set fileformat=unix
"" Cabal Config
"au BufNewFile,BufRead *.cabal
"    \ set autoindent |
"		\ set tabstop=2 |
"		\ set softtabstop=2 | 
"    \ set nu 

" JSON config
au BufNewFile,BufRead *.json set filetype=json
" let g:syntastic_python_checkers = ['pylint']
