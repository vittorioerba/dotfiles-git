""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Environment
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

set nocompatible

set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//

"persistent undos
set undodir=~/.vim/undodir
set undofile

filetype plugin on 		" load type indent file from runtimepath

let mapleader=","

set autowriteall " write files when changing buffer

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Spaces, tabs and indentation
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set backspace=indent,eol,start
set tabstop=4           " 4 space tab
set expandtab           " use spaces for tabs
set softtabstop=4       " 4 space tab

set shiftwidth=4		" 4 space block indentation
filetype indent on		" load type indent file from runtimepath
set autoindent
set pastetoggle=<F2>            "paste mode

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" UI
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set wildmenu			" show menu for command autocomplete
set lazyredraw			" don't redraw too much the screen
" set fillchars=stl:-     " fill active window's statusline with -
" set fillchars+=stlnc:-  " also fill inactive windows
set fillchars+=vert:┃	" change vertical splitting character
set number              " show real current line number

set scrolloff=100        " leave rows above and below cursor line
" set cursorline          " highlight current line

" line wrap
set wrap               " soft-wrap lines
set linebreak          " soft-wrap lines only at certain characters (see :help breakat)
set showbreak=------>\  " line up soft-wrap prefix with the line numbers
set cpoptions+=n        " start soft-wrap lines (and any prefix) in the line-number area

" Folding
set foldmethod=syntax   " fold based on indent level
set foldnestmax=10      " max 10 depth
set foldenable          " don't fold files by default on open
set foldlevelstart=10   " start with fold level of 1

" Syntax
syntax enable
" set spell
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Search and autocompletion
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set showmatch           " higlight matching parenthesis

" set ignorecase          " ignore case when searching
set incsearch           " search as characters are entered
set hlsearch            " highlight all matches

set path+=**

autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
