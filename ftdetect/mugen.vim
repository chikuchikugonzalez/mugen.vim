" -*- coding: utf-8 -*-
function! mugen#ftdetect()
    let s:buffer = getline(1, 512)
    if match(s:buffer, "^\\c\\s\\{-0,}\\[\\(remap\\|command\\|statedef\\|begin\\s\\{-1,}action\\)") != -1
        return 1
    elseif match(s:buffer, "^\\c\\s\\{-0,}\\<mugenversion\\>\\s\\{-0,}=.*$") != -1
        return 2
    endif
    return 0
endfunction

autocmd BufRead     *.cns   setf mugen
autocmd BufRead     *.st    setf mugen
autocmd BufNewFile  *.cns   setf mugen
autocmd BufNewFile  *.st    setf mugen
autocmd BufReadPost *.cmd,*.def,*.air,*.cns,*.st
            \ if mugen#ftdetect() > 0 |
            \     call SetSyn("mugen") |
            \ endif

" vim: set sts=4 ts=4 sw=4 expandtab:
