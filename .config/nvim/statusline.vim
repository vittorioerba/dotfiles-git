hi User1 ctermfg=none ctermbg=0
hi User2 ctermfg=5 ctermbg=none
hi User3 ctermfg=0 ctermbg=5
hi User4 ctermfg=5 ctermbg=0
hi User5 ctermfg=6 ctermbg=none
hi User6 ctermfg=0 ctermbg=6
hi User7 ctermfg=0 ctermbg=none
hi User8 ctermfg=6 ctermbg=0
hi User9 ctermfg=NONE ctermbg=NONE cterm=NONE

hi StatColor ctermbg=5 ctermfg=0
hi StatColor2 ctermbg=6 ctermfg=0
hi Modified ctermbg=0 ctermfg=5
hi Modified2 ctermbg=0 ctermfg=6

function! MyStatusLine(mode)
    let statusline=""
    if a:mode == 'Enter'
        let statusline.="%2\ %#StatColor#"
    elseif a:mode == 'Leave'
        let statusline.="%2\ %#Modified#"
    endif
    let statusline .= "\ %f\ %4*"
    let statusline .= "\ %1*\ %1*%{mode()}"
    let statusline .= "%1*\ %m%7*"
    let statusline .= "%9*%="
    let statusline .= "\ %7*%1*\ %v:%l\/%L"
    let statusline .= "\ %8*"
    if a:mode == 'Enter'
        let statusline.="%#StatColor2#"
    elseif a:mode == 'Leave'
        let statusline.="%#Modified2#"
    endif
    let statusline .= "\ %Y\ %5*"
    return statusline
endfunction

function! InsertStatuslineColor(mode)
  if a:mode == 'i'
    hi StatColor ctermbg=3
  endif
endfunction

au WinEnter * setlocal statusline=%!MyStatusLine('Enter')
au WinLeave * setlocal statusline=%!MyStatusLine('Leave')

set statusline=%!MyStatusLine('Enter')

au InsertEnter * call InsertStatuslineColor(v:insertmode)
au InsertLeave * hi StatColor ctermbg=5 ctermfg=0
