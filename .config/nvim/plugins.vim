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
    Plug 'tpope/vim-commentary'
    Plug 'junegunn/vim-easy-align'
    Plug 'tpope/vim-surround'

    " syntax and languages
    Plug 'ledger/vim-ledger'
    Plug 'lervag/vimtex'
    Plug 'digitaltoad/vim-pug'
    Plug 'JuliaEditorSupport/julia-vim'

    " autocompletion
    Plug 'SirVer/ultisnips'

    " useful
    Plug 'vim-voom/VOoM'  " outliner
    Plug 'rafaqz/citation.vim' " citations from zotero

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
