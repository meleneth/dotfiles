version 6.0
set noautoindent
set nobackup
set bs=2
set background=dark
set nocompatible
set comments=b:#,:%,fb:-,n:>,n:)
set esckeys
set noexpandtab
set fo=cqrt
set hidden
set iskeyword=@,48-57,_,192-255,-,.,:,/,@-@
set lazyredraw
"set listchars=tab:»·,trail:·
set statusline=[%n]\ %f\ %(\ %M%R%H)%)\=Pos=<%l\,%c%V>\ %P
set tabstop=8
hi normal ctermfg=white ctermbg=black guifg=white guibg=black
hi nontext ctermfg=blue ctermbg=black guifg=blue guibg=black
set guifont=kates
set foldmethod=syntax
"autocmds
autocmd!
au BufNewFile,BufRead *.py set ai et sw=4 ts=4 
au FileType c set ai sw=4 ts=4

"hi! Comment            ctermfg=blue ctermbg=black guifg=blue guibg=black
"hi normal ctermbg=black guibg=black
syn on
