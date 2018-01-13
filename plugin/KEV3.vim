scriptencoding utf-8

if exists('g:loaded_KEV3')
    finish
endif
let g:loaded_KEV3 = 1

call KEV3#KEV3boot()
command KEV3 :call KEV3#KEV3boot()

finish

"#! -- Copyright (c) 2016-2018 ooblog --
"#! License: MIT　https://github.com/ooblog/TSF3KEV/blob/master/LICENSE
