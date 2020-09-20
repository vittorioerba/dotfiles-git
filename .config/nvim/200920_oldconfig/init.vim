""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NVim configuration
" Author: Vittorio Erba
"
" Useful sources, inspiration = places from where I've blatantly stolen
" - https://raw.githubusercontent.com/changemewtf/no_plugins/master/no_plugins.vim
" - https://www.reddit.com/r/Zettelkasten/comments/fidaum/vimzettel_an_addon_for_the_vimwiki_addon_for_vim/
" -
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

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

" quickly modify vimrc and zshrc, and reload vimrc
nnoremap <leader>ev :sp ~/.config/nvim/init.vim<CR>
nnoremap <leader>ez :sp ~/.zshrc<CR>
nnoremap <leader>sv :source ~/.config/nvim/init.vim<CR>

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
" window switching
nnoremap <C-down> <C-W>j
nnoremap <C-up> <C-W>k
nnoremap <C-right> <C-W>l
nnoremap <C-left> <C-W>h

set wildmenu			" show menu for command autocomplete
set lazyredraw			" don't redraw too much the screen
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
nnoremap <space> za

" Syntax
syntax enable
set spell
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Search and autocompletion
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set showmatch           " higlight matching parenthesis

set ignorecase          " ignore case when searching
set incsearch           " search as characters are entered
set hlsearch            " highlight all matches
nnoremap <leader><space> :noh<CR>

set path+=**

autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $HOME/.config/nvim/init.vim
endif

call plug#begin('~/.vim/plugged')
    Plug 'ledger/vim-ledger'
    Plug 'tpope/vim-commentary'
    Plug 'SirVer/ultisnips'
    Plug 'lervag/vimtex'
    Plug 'morhetz/gruvbox'
    Plug 'junegunn/vim-easy-align'
    Plug 'JuliaEditorSupport/julia-vim'
    Plug 'tpope/vim-surround'
    Plug 'digitaltoad/vim-pug'
    Plug 'vim-voom/VOoM'
    Plug 'Shougo/unite.vim'
    Plug 'rafaqz/citation.vim'
    " Plug 'Yggdroot/indentLine'
    " Plug 'cocopon/iceberg.vim'
    " Plug 'arcticicestudio/nord-vim'
    " Plug 'alok/notational-fzf-vim'
    " Plug 'vimwiki/vimwiki'
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'
    " Plug 'michal-h21/vim-zettel'
    " Plug 'KevinBockelandt/notoire'
call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colors
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set termguicolors
" colorscheme gruvbox
source $HOME/.config/nvim/colorscheme.vim
hi Normal guibg=NONE ctermbg=NONE

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
" let g:vimtex_compiler_latexmk = {'callback' : 0}
" let g:vimtex_latexmk_build_dir='build'
" let g:vimtex_view_general_options = '-r @line @pdf @tex'
" let g:vimtex_view_general_options_latexmk = '-r 1'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Gnuplot
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup gnuplot
    autocmd!
    autocmd FileType gnuplot :nnoremap <leader>w :w<CR>:!gnuplot %<CR>
augroup END
autocmd FileType gnuplot setlocal commentstring=#\ %s

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim easy align
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Notational fzf
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:nv_search_paths = ['~/wiki']

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vimwiki
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:vimwiki_list = [{'path':'~/Cloud/zk/markdown', 'syntax': 'markdown', 'ext': '.md'}, {"path":"~/Cloud/zk/wiki/"}]
" let g:vimwiki_global_ext = 0
" let g:vimwiki_folding = 'expr'
" let g:vimwiki_auto_chdir = 1

" " see files linkg to this note
" nnoremap <leader>bl :VimwikiBacklinks<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-zettel.vim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:zettel_format = "%y%m%d-%H%M"
" let g:zettel_options = [{"template" :  "~/Cloud/zk/settings/template.tpl"}]
" let g:zettel_default_mappings = 0

" " search in all other notes to insert link
" imap [[ [[<esc>:ZkLink<cr>
" " copy the current note link to paste it in another note
" nmap T <Plug>ZettelYankNameMap
" xmap z <Plug>ZettelNewSelectedMap<cr>:$<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" notorie
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:notoire_folder = '~/Cloud/zk/'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" My zettelkasten
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! Zk_print_filename(input)
  " the filename is separated by : from rest of the line
  let filename = split(a:input,":")[0]
  " we need to remove the extension

  let line = getline('.')
  " replace the [[ with selected link and title
  let caret = col('.')
  call setline('.', strpart(line, 0, caret) . filename .  strpart(line, caret) . ']]')
  call cursor(line('.'), caret + len(filename) +2)
  call feedkeys("a", "n")

endfunction

command! -bang -nargs=? -complete=dir ZkLink call fzf#vim#ag(<q-args>,
      \'--skip-vcs-ignores', fzf#vim#with_preview({
      \'down': '~40%',
      \'sink': function('Zk_print_filename'),
      \'dir':'~/Cloud/zk/markdown/',
      \'options': ['--exact', '--tiebreak=end']}))

function! Zk_new_note()
  " generate tiestamp based name
  let filename = strftime("%y%m%d%H%M%S") . '.md'

  " write filename in current file as a link
  let line = getline('.')
  let caret = col('.')
  call setline('.', strpart(line, 0, caret) . '[[' . filename .  strpart(line, caret) . ']]')
  call cursor(line('.'), caret + len(filename) + 4 -3)

  " create new file
  call system("touch ~/Cloud/zk/markdown/" . filename)

  " get current file name
  let currentfile = expand('%:t')

  " print current file name at the beginning of the new note
  call system("echo \"[[" . currentfile ."]]\" > ~/Cloud/zk/markdown/" . filename)
endfunction

" look for files and content in zettelkasten, and autocomplete link
autocmd BufNewFile,BufRead /home/vittorio/Cloud/zk/markdown/*.md imap [[ [[<esc>:ZkLink<cr>
" follow link by using gf on the name of the link itself
autocmd BufNewFile,BufRead /home/vittorio/Cloud/zk/markdown/*.md nmap <cr> :e <cfile><cr>
" get to previous buffer, i.e. previous note
autocmd BufNewFile,BufRead /home/vittorio/Cloud/zk/markdown/*.md map <BS> :b#<cr>
" get to parent node (the one you created this from
autocmd BufNewFile,BufRead /home/vittorio/Cloud/zk/markdown/*.md nmap <leader>p gg<cr>
" create new note and insert link in the current position
autocmd BufNewFile,BufRead /home/vittorio/Cloud/zk/markdown/*.md nnoremap <leader>z :call Zk_new_note()<CR>

" TODO: abstract zk path away from commands!


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" citation.vim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:citation_vim_mode="zotero"
let g:citation_vim_zotero_path="~/Zotero"
let g:citation_vim_zotero_version=5
let g:citation_vim_cache_path='~/.vim/cache'
let g:citation_vim_outer_prefix="["
let g:citation_vim_inner_prefix="@"
let g:citation_vim_suffix="]"

nmap <leader>u [unite]
nnoremap [unite] <nop>
" nnoremap <silent>[unite]c  :<C-u>Unite -buffer-name=citation-start-insert -default-action=append citation/key<cr>
" nnoremap <silent>[unite]co :<C-u>Unite -input=<C-R><C-W> -default-action=pdfOpen -force-immediately citation/file<cr>
nnoremap <leader>cc :<C-u>Unite -buffer-name=citation-start-insert -default-action=append citation/key<cr>
nnoremap <leader>co :<C-u>Unite -input=<C-R><C-W> -default-action=pdfOpen -force-immediately citation/file<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Voom
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:voom_tree_width = 80
let g:voom_default_mode = 'markdown'
nnoremap <leader>v :VoomToggle<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Unite
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let pdfOpen = {
      \ 'description' : 'insert candidates into command line, prepends them with !zathura, and executes',
      \ 'is_selectable' : 1,
      \ }
function! pdfOpen.func(candidates) abort "{{{
  " Result is ':| {candidate}', here '|' means the cursor position.
  call feedkeys(printf(":!zathura %s & \<Cr>",
        \ join(map(map(copy(a:candidates),
        \ "has_key(v:val, 'action__path') ? v:val.action__path : v:val.word"),
        \ 'escape(v:val, " *?[{`$\\%#\"|!<>")'))), 'n')
endfunction
call unite#custom#action('common', 'pdfOpen', pdfOpen)
unlet pdfOpen
