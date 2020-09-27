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
colorscheme base16-default-dark

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
