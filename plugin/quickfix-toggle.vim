"command -bang -nargs=? QFix call QFixToggle(<bang>0)
"function! QFixToggle(forced)
"  if exists("g:qfix_win") && a:forced == 0
"    cclose
"    unlet g:qfix_win
"  else
"    copen 10
"    let g:qfix_win = bufnr("$")
"  endif
"endfunction

command -bang -nargs=? QFix call QFixToggle()
function! QFixToggle()
    for i in range(1, winnr("$"))
        let bnum = winbufnr(i)
        if getbufvar(bnum, '&buftype') == 'quickfix'
            cclose
            return
        endif
    endfor
    copen
endfunction
