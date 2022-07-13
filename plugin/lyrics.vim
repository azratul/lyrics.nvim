if exists('g:loaded_lyrics') | finish | endif " prevent loading file twice

let s:save_cpo = &cpo " save user coptions
set cpo&vim           " reset them to defaults

" command to run our plugin
command! -nargs=* Lyrics lua require("lyrics").run(<q-args>)

let &cpo = s:save_cpo " and restore after
unlet s:save_cpo

let g:loaded_lyrics = 1
