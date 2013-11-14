syn match cOper display "="
syn match cOper display "\*"
syn match cOper display "+"
syn match cOper display "-"
syn match cOper display "/"
syn match cArrow display ","
syn match cOper display ">"
syn match cOper display "<"
syn match cArrow display "\."
syn match cArrow display "::"
syn match cSemiColon display ";"
syn match cType display "Uint32"
syn match cType display "Sint32"
syn match cType display "Uint16"
syn match cType display "Sint16"
syn match cArrow display "->"
syn match cArrow display "private"
syn match cArrow display "protected"



hi cArrow ctermfg=yellow guifg=yellow
hi cOper ctermfg=red guifg=red
hi cSemiColon ctermfg=yellow guifg=yellow
