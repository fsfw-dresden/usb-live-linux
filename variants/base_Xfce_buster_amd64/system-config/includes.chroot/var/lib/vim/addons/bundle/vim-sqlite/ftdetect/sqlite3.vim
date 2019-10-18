" Vim filetype detection file

if &compatible || v:version < 603
    finish
endif


au BufNewFile,BufRead *
    \ if (getline(1) =~? "^SQLite format 3") |
    \     set filetype=sqlite3 |
    \ endif
