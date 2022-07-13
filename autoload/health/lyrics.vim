function! health#lyrics#check()
    if !has('nvim-0.5')
        call health#report_warn("please install nvim > 0.5")
    else
        call health#report_ok("nvim 0.5 installed")
    endif

    if !executable('lua')
        call health#report_error("please install lua")
    else
        call health#report_ok("lua installed")
    endif

    try
        lua require('plenary.curl')
        call health#report_ok("plenary.curl installed")
    catch
        call health#report_error("please install plenary.curl")
    endtry
endfunction
