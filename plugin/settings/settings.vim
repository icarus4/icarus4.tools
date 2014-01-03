syntax on

set tabstop=4
set softtabstop=4
set shiftwidth=4

set cindent
set hlsearch
set incsearch
set ignorecase
set linebreak
set nocompatible
set number
set ruler						" show the cursor position all the time
set smartindent
set wrap

set encoding=utf-8
set history=1000				" keep 1000 lines of command line history
set scrolloff=5					" start scrolling when n lines away from margins

" Enter to cancel searched highlight
noremap <CR> :nohlsearch<CR>

" jj = <ESC>
inoremap jj <ESC>

" Identation
map <TAB> v>
nmap <S-TAB> v<
vmap <TAB> >gv 
vmap <S-TAB> <gv 

" Force myself not to use arrow keys
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>
