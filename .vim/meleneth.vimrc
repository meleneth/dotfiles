set nocp " :-)
"turn these ON:
set digraph ek hidden ruler sc vb wmnu
" turn these OFF:
set noeb noet nosol
" non-toggles:
set bs=2 ls=2 shm=at tw=72 ww=<,>,h,l
set comments=b:#,:%,fb:-,n:>,n:)
"set list listchars=tab:»·,trail:·
set viminfo=%,'50,\"100,:100,n~/.viminfo
" FormatOptions set by meleneth to avoid word wrap
set fo=""
" settings which are the default
" (at least with "nocompatible" anyway):
" set smd sw=8 ts=8
" mappings:
map K <NUL>
map <C-Z> :shell
map ,F :view $VIMRUNTIME/filetype.vim
map ,SO :source $VIMRUNTIME/syntax/
map ,V :view $VIMRUNTIME/syntax/
" autocommands:
au FileType mail set tw=70

" some colors: "white on black"
hi normal ctermfg=white ctermbg=black guifg=white guibg=black
hi nontext ctermfg=blue ctermbg=black guifg=blue guibg=black
" syntax coloring!! :-)
set smartindent
" Python edit only:

autocmd BufRead                 *.py set expandtab
 
 
set ts=4
syn on


