set number

colorscheme desert

syntax on

set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

set cindent
set autoindent
set smarttab

set ignorecase
set smartcase
set hlsearch
set incsearch

set cursorline

set ttimeoutlen=100

" For netrw
set nocompatible
filetype plugin indent on

" gx to open a link using browser.
let g:netrw_browsex_viewer = "xdg-open"

" State files
set viminfofile=~/.local/state/vim/viminfo
set undodir=~/.local/state/vim/undo
set undofile
let g:netrw_home=$HOME."/.local/state/vim"

" termresponse of foot emits some weird garbage
if &term == "foot"
    set t_RV=
endif

set showcmd
set shortmess-=S

