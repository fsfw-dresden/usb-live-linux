execute "silent %!sqlite3" . ' "%" .dump' 
let &readonly=1
let &ft="sql"
