syn match Operator display "-"
syn match cArrow display "="
syn match cArrow display "->"
syn match cArrow display "=>"
syn match cSemiColon display ";"
syn match cparen display "("
syn match cparen display ")"
syn match cDoubleColon display "::"
syn match Type display "Uint16"
syn match Type display "Uint32"
syn match Type display "Uint8"
syn match Type display "Sint8"
syn match Type display "Sint16"
syn match Type display "Sint32"
syn match Type display "SDL_Surface"
syn match cPeriod display "\."
syn match cStar display "\*"
syn match cThis display "this"
syn match cThis display "\$self"
syn match Operator display "/"
syn match Curly display "{"
syn match Curly display "}"


syn match SQL display "SELECT"
syn match SQL display "MAX"
syn match SQL display "WHERE"
syn match SQL display "FROM"
syn match SQL display "INSERT"
syn match SQL display "UPDATE"
syn match SQL display "AND"
syn match SQL display "SET"
syn match SQL display "DECODE"
syn match SQL display "NVL"
syn match SQL display "TO_DATE"
syn match SQL display "GROUP BY"
syn match SQL display "ORDER BY"
syn match SQL display "NULL"
syn match SQL display "IS NOT"

hi cArrow guifg=Yellow  ctermfg=Yellow 
hi cSemiColon guifg=DarkGrey ctermfg=Red
hi cparen guifg=Yellow ctermfg=Yellow
hi cDoubleColon guifg=Yellow ctermfg=Yellow
hi cPeriod guifg=White ctermfg=White
hi cStar guifg=Green ctermfg=Green
hi cThis guifg=White ctermfg=White
hi Operator guifg=LightGreen ctermfg=LightGreen
hi Function guifg=DarkCyan ctermfg=DarkCyan
hi Keyword guifg=LightBlue ctermfg=LightBlue
hi SQL guifg=LightGreen guibg=DarkBlue
hi Curly guifg=Green ctermfg=Green
