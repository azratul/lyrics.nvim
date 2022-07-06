function! ReloadLyrics()
lua << EOF
    for k in pairs(package.loaded) do
        if k:match("^lyrics") then
            package.loaded[k] = nil
        end
    end
EOF
endfunction
" Reload the plugin
nnoremap <Leader>prb :call ReloadLyrics()<CR>
" Test the plugin
nnoremap <Leader>pth :lua require("lyrics").run()<CR>
