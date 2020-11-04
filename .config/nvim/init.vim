" NVim configuration
" Author: Vittorio Erba
"
" Useful sources, inspiration = places from where I've blatantly stolen
" - https://raw.githubusercontent.com/changemewtf/no_plugins/master/no_plugins.vim
" - https://www.reddit.com/r/Zettelkasten/comments/fidaum/vimzettel_an_addon_for_the_vimwiki_addon_for_vim/
" - https://github.com/rajshekhar26/dotfiles
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"" SETTINGS

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

set ignorecase          " ignore case when searching
set incsearch           " search as characters are entered
set hlsearch            " highlight all matches

set path+=**

autocmd FileType html set omnifunc=htmlcomplete#CompleteTags

"" MAPPINGS

" quickly modify vimrc and zshrc, and reload vimrc
nnoremap <leader>ev :vsp ~/.config/nvim/init.vim<CR>
nnoremap <leader>ez :vsp ~/.zshrc<CR>
nnoremap <leader>sv :source ~/.config/nvim/init.vim<CR>

" window switching
nnoremap <C-down> <C-W>j
nnoremap <C-up> <C-W>k
nnoremap <C-right> <C-W>l
nnoremap <C-left> <C-W>h

" fold all
nnoremap <space> za

" unhighlight search
nnoremap <leader><space> :noh<CR>

"" PLUGINS

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""" External programs
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Gnuplot
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup gnuplot
    autocmd!
    autocmd FileType gnuplot :nnoremap <leader>w :w<CR>:!gnuplot %<CR>
augroup END
autocmd FileType gnuplot setlocal commentstring=#\ %s

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""" Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $HOME/.config/nvim/init.vim
endif

call plug#begin('~/.vim/plugged')
    " better behaviour
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'
    Plug 'BurntSushi/ripgrep'
    Plug 'tpope/vim-commentary'
    Plug 'junegunn/vim-easy-align'
    Plug 'tpope/vim-surround'

    " syntax and languages
    Plug 'ledger/vim-ledger'
    Plug 'lervag/vimtex'
    Plug 'digitaltoad/vim-pug'
    Plug 'JuliaEditorSupport/julia-vim'
    Plug 'rsmenon/vim-mathematica'
    Plug 'tbastos/vim-lua' 
    
    " autocompletion
    Plug 'SirVer/ultisnips'

    " useful
    Plug 'vim-voom/VOoM'  " outliner
    Plug 'rafaqz/citation.vim' " citations from zotero
    Plug 'fiatjaf/neuron.vim'

    " colors
    Plug 'chriskempson/base16-vim'
    Plug 'fenetikm/falcon'
    Plug 'morhetz/gruvbox'
    Plug 'rakr/vim-one'
    Plug 'mhartington/oceanic-next'
    Plug 'arcticicestudio/nord-vim'
call plug#end()


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ultisnips
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="horizontal"

set runtimepath+=~/dotfiles/nvim/
let g:UltiSnipsSnippetsDir="~/.config/nvim/mySnippets"
let g:UltiSnipsSnippetDirectories=["mySnippets"]

nnoremap <leader>ue :UltiSnipsEdit<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Hledger
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ledger_bin = 'hledger'
let g:ledger_align_At = 100

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Neuron
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:zkdir = '/home/vittorio/Documenti/kb/'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vimtex
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:vimtex_view_method = 'zathura'
let g:tex_flavor = 'latex'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim easy align
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)


"" COLORS

if (empty($TMUX))
  if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

let base16colorspace=256  " Access colors present in 256 colorspace

" let g:falcon_background = 0
" let g:falcon_inactive = 0
colorscheme nord
hi Normal guibg=NONE ctermbg=NONE

" syntax enable*
" hi Function ctermfg=4
" hi Statement ctermfg=3
" hi Type ctermfg=6
" hi Comment ctermfg=8
" hi Boolean ctermfg=2
" hi PreProc ctermfg=4
" hi Visual ctermbg=6 ctermfg=0
" hi Special ctermfg=5
" hi Underlined ctermfg=1 cterm=underline
" hi Identifier cterm=NONE
" hi VertSplit ctermbg=4 ctermfg=0
" hi SpellBad cterm=underline

" " search highlights
" hi Search ctermbg=6 ctermfg=0 cterm=NONE

" " popup menu
" hi Pmenu ctermbg=0 ctermfg=6
" hi PmenuSel ctermbg=12 ctermfg=0

" " line numbers
" hi LineNr ctermfg=8
" hi CursorLine cterm=NONE ctermbg=0
" hi CursorLineNr ctermbg=NONE ctermfg=6 cterm=NONE


