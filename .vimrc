set noerrorbells
set encoding=utf-8
set ruler
set autoindent
set tabstop=4
set shiftwidth=4
set expandtab
set autowriteall
set mouse=a
set scrolloff=999
set textwidth=100

set ignorecase
set smartcase
set gdefault
set incsearch
set hlsearch
set spell spelllang=en_us

autocmd BufRead,BufNewFile *.md call EditProse()

function! EditProse()
    set makeprg=proselint\ %
    set formatoptions+=an
    set linebreak
endfunction

map j gj
map k gk
" Get word count
map <C-S-c> g<C-g>

" Toggle between "textwidth and wrap" and "textwidth=0 and nowrap" for
" creating tables and other consecutive-line text for markdown.
let s:textwidth=100
let &l:textwidth=s:textwidth

function! ToggleWrap() "{{{
  " if textwidth and wrap is used, then disable them
  if &textwidth > 0
    let &l:textwidth=0
    setlocal nowrap
    set formatoptions&vim
    echo "Wrap Off"
  else " otherwise re-enable them
    let &l:textwidth=s:textwidth
    setlocal wrap
    set formatoptions+=an
    echo "Wrap On"
  endif
endfunction

packadd! dracula
syntax enable
colorscheme dracula

