" AlignMaps:   Alignment maps based upon <Align.vim>
" Maintainer:  Dr. Charles E. Campbell, Jr. <Charles.Campbell@gsfc.nasa.gov>
" Last Change: Oct 31, 2002
" Version:     17
"
" NOTE: the code herein needs vim 6.0 or later
"       and needs <Align.vim> v6 or later
"
" Use 'a to mark beginning of to-be-aligned region,   Alternative:  use v
" move cursor to end of region, and execute map.      (visual mode) to mark
" The maps also set up marks 'y and 'z, and retain    region, execute same map.
" 'a at the beginning of region.                      Uses 'a, 'y, and 'z.
"
" Version 6 of <Align.vim> introduced the 'm' control option which causes
" <Align.vim> to AlignPush at entry and AlignPop at return.  The maps
" herein use that feature so that user preferences are left unaffected
" through use of any of the maps herein.
"
" Although the comments indicate the maps use a leading backslash,
" actually they use <Leader> (:he mapleader), so the user can
" specify that the maps start how he or she prefers.
"
" Note: these maps all use <Align.vim>.  For those maps which do
"       alignment on constructs (\acom, \adec, etc), a series of substitutes
"       is used to insert "@" symbols in appropriate locations.  Align() is
"       then used to do alignment directly on "@"s; then it is followed by
"       further substitutes to do clean-up.  However, the maps \WS and \WE
"       protect embedded "@" symbols by first converting them to <DEL>
"       characters, doing the requested job, and then converting them back.
"
"  \a,    : useful for breaking up comma-separated declarations prior to \adec
"  \abox  : put a C-style comment box around selected lines
"  \acom  : useful for aligning comments
"  \ascom : like \acom, but ignores lines that *begin* with comments
"  \adec  : useful for aligning declarations
"  \adef  : useful for aligning definitions
"  \afnc  : useful for aligning ansi-c style functions' argument lists
"  \tsp   : use Align to make a blank-based table, get rid of trailing blanks
"  \tt    : useful for LaTeX tabulars
"  \tx    : make a left-justifed  alignment on character "x"  (,:<=@ blank |#)
"  \Tx    : make a right-justifed alignment on character "x"  (,:<=@ blank |#)
"
" History:
"   17  : Nov 04, 2002 : \afnc now handles // comments correctly and commas
"                        within comments
"   16  : Sep 10, 2002 : changed : to :silent! for \adec
"   15  : Aug 27, 2002 : removed some <c-v>s
"   14  : Aug 20, 2002 : \WS, \WE mostly moved to functions, marks y and z
"                        now restored
"   11  : Jul 08, 2002 : \abox bug fix
"    9  : Jun 25, 2002 : \abox modified to handle leading initial white space
"                      : various bugfixes to \afnc, \T=, etc
" ---------------------------------------------------------------------

" Prevent duplicate loading
if exists("g:loaded_alignmaps") || &cp
 finish
endif
let g:loaded_alignmaps= 1

" ---------------------------------------------------------------------

" WS: wrapper start (internal)   Produces a blank line above and
"     below, marks with 'y and 'z
if !hasmapto('<Plug>WrapperStart')
 nmap <unique> \WS	<Plug>AlignMapsWrapperStart
endif
nmap <silent> <script> <Plug>AlignMapsWrapperStart	:set lz<CR>:call <SID>WrapperStart()<CR>
fu! <SID>WrapperStart()
  let b:curline     = line(".")
  let b:curcol      = virtcol(".")
  let b:keepsearch  = @/
  let b:keepline_my = line("'y")
  let b:keepcol_my  = virtcol("'y")
  let b:keepline_mz = line("'z")
  let b:keepcol_mz  = virtcol("'z")
  put =''
  norm! mz'a
  put! = ''
  let b:ch= &ch
  set ch=2
  norm! my
  exe "'y,'zs/@/\177/ge"
  norm! 'zk
endfunction

" WE: wrapper end (internal)   Removes guard lines,
"     restores marks y and z, and restores search pattern
if !hasmapto('<Plug>WrapperEnd')
 nmap <unique> \WE	<Plug>AlignMapsWrapperEnd
endif
nmap <silent> <script> <Plug>AlignMapsWrapperEnd	:call <SID>WrapperEnd()<CR>:set nolz<CR>
fu! <SID>WrapperEnd()
  'y,'zs/\s\+$//e
  exe "'y,'zs/\177/@/ge"
  norm! 'yjmakdd'zdd
  exe "set ch=".b:ch
  unlet b:ch
  let @/= b:keepsearch
  if b:keepline_my != 0
   exe "norm! ".b:keepline_my."G".b:keepcol_my."\<bar>"
  endif
  if b:keepline_mz != 0
   exe "norm! ".b:keepline_mz."G".b:keepcol_mz."\<bar>"
  endif
  exe 'norm! '.b:curline.'G'.b:curcol."\<bar>"
  unlet b:keepline_my b:keepcol_my
  unlet b:keepline_mz b:keepcol_mz
  unlet b:curline     b:curcol
endfunction

" ---------------------------------------------------------------------

" complex C-code alignment maps
map <silent> <Leader>a?    \WS:AlignCtrl mIp1P1lC ? : : : : <CR>:'a,.Align<CR>:'a,'z-1s/\(\s\+\)? /?\1/e<CR>\WE
map <silent> <Leader>a,    \WS:silent 'y,'zs/\(.\)\s\+/\1 /g<CR>'yjma'zk\jnr,<CR>:silent 'y,'zg/,/let @x=substitute(getline(line(".")),'^\(.\{-}\) \S\+\s*,.*$','silent s/,/;\\r\1 /g','')<Bar>@x<CR>\WE
map <silent> <Leader>abox  \WS:let b:iws=substitute(getline("'a"),'^\(\s*\).*$','\1','e')<CR>:'a,'z-1s/^\s\+//e<CR>:'a,'z-1s/^.*$/@&@/<CR>:AlignCtrl m=p01P0w @<CR>:'a,.Align<CR>:'a,'z-1s/@/ * /<CR>:'a,'z-1s/@$/*/<CR>'aYP:s/./*/g<CR>0r/'zkYp:s/./*/g<CR>0r A/<Esc>:exe "'a-1,'z-1s/^/".b:iws."/e"<CR>\WE
map <silent> <Leader>acom  \WS:'a,.s/\/[*/]/@&@/e<CR>:'a,.s/\*\//@&/e<CR>'zk<Leader>tW@:'y,'zs/^\(\s*\) @/\1/e<CR>:'y,'zs/ @//eg<CR>\WE
map <silent> <Leader>ascom \WS:'a,.s/\/[*/]/@&@/e<CR>:'a,.s/\*\//@&/e<CR>:silent! 'a,.g/^\s*@\/[*/]/s/@//ge<CR>:AlignCtrl v ^\s*\/\*<CR>'zk<Leader>tW@:'y,'zs/^\(\s*\) @/\1/e<CR>:'y,'zs/ @//eg<CR>\WE
map <silent> <Leader>adec  \WS:'a,'zs/\([^ \t/]\)\([*&]\)/\1 \2/e<CR>:silent! 'a,'zs/\/\*\\|\/\//\r&/e<CR>:silent! 'y,'zv/^\//s/\([^ \t]\)\s\+/\1 /eg<CR>:silent! 'y,'zv/^\//s/\([*&]\) \+/\1/ge<CR>:silent! 'y,'zg/^\//norm! kJ<CR>:silent! 'y,'zs/^\([^=*&[]* \)\([*(&]*\)\([a-zA-Z0-9_()]\+\) *\(\(\[.\{-}]\)*\) *\(=\)\= *\(.\{-}\)\= *;/\1@\2#@\3\4@\6@\7;@/e<CR>:silent! 'y,'zs/\*\/\s*$/@*\//e<CR>:silent! 'y,'zs/^\s\+\*/@@@@@* /e<CR>:silent! 'y,'zs/^@@@@@\*\(.*[^*/]\)$/&@*/e<CR>'yjma'zk<Leader>t@:silent! 'y,'zs/@ //ge<CR>:silent! 'y,'zs/\(\s*\);/;\1/e<CR>:silent! 'y,'zs/# //e<CR>:silent! 'y,'zv/^\s\+\*/s/\([^/*]\)\(\*\+\)\( \+\)/\1\3\2/e<CR>:silent! 'y,'zv/^\s\+\*/s/\((\+\)\( \+\)\*/\2\1*/e<CR>:silent! 'y,'zs/^\(\s\+\) \*/\1*/e<CR>:silent! 'y,'zs/[ \t@]*$//e<CR>\WE
map <silent> <Leader>adef  \WS:'a,.s/^\(\s*\)#\(\s\)*define\s*\(\I[a-zA-Z_0-9(),]*\)\s*\(.\{-}\)\($\<Bar>\/\*\)/#\1\2define @\3@\4@\5/e<CR>:'a,.s/\($\<Bar>\*\/\)/@&/e<CR>'zk<Leader>t@'yjma'zk:'a,.s/ @//g<CR>\WE
map <silent> <Leader>afnc :set lz<CR>:silent call <SID>Afnc()<CR>:set nolz<CR>

" html table alignment
map <silent> <Leader>Htd \WS:'y,'zs%<TR><TD[^>]\{-}>\<Bar></TD><TD[^>]\{-}>\<Bar></TD></TR>%@&@%g<CR>'yjma'zk:AlignCtrl m=Ilp1P0 @<CR>:'a,.Align<CR>:'y,'zs/ @/@/<CR>:'y,'zs/@ <TR>/<TR>/ge<CR>:'y,'zs/@//ge<CR>\WE

" character-based right-justified alignment maps
map <silent> <Leader>T| \WS:AlignCtrl mIp0P0=r <Bar><CR>:'a,.Align<CR>\WE
map <silent> <Leader>T#   \WS:AlignCtrl mIp0P0=r #<CR>:'a,.Align<CR>\WE
map <silent> <Leader>T,   \WS:AlignCtrl mIp0P1=r ,<CR>:'a,.Align<CR>\WE
map <silent> <Leader>T:   \WS:AlignCtrl mIp1P1=r :<CR>:'a,.Align<CR>\WE
map <silent> <Leader>T;   \WS:AlignCtrl mIp0P0=r ;<CR>:'a,.Align<CR>\WE
map <silent> <Leader>T<   \WS:AlignCtrl mIp0P0=r <<CR>:'a,.Align<CR>\WE
map <silent> <Leader>T=   \WS:'a,'zs/\s\+\([*/+\-%<Bar>&\~^]\==\)/ \1/e<CR>:'a,'zs@ \+\([*/+\-%<Bar>&\~^]\)=@\1=@ge<CR>'zk:'a,.s/; */;@/e<CR>'zk:AlignCtrl mIp1P1=r = @<CR>:AlignCtrl g =<CR>:'a,.Align<CR>'zk:'a,.s/; *@/;/e<CR>'zk:'a,.s/; *$/;/e<CR>'zk:'a,.s@\([*/+\-%<Bar>&\~^]\)\( \+\)=@\2\1=@ge<CR>'zk:'a,.s/\( \+\);/;\1/ge<CR>\WE
map <silent> <Leader>T?   \WS:AlignCtrl mIp0P0=r ?<CR>:'a,.Align<CR>:'y,'zs/ \( *\);/;\1/ge<CR>\WE
map <silent> <Leader>T@   \WS:AlignCtrl mIp0P0=r @<CR>:'a,.Align<CR>\WE
map <silent> <Leader>Tab  \WS:'a,.s/^\(\t*\)\(.*\)/\=submatch(1).substitute(submatch(2),'\t','@','g')/<CR>:AlignCtrl mIp0P0=r @<CR>:'a,.Align<CR>:'y+1,'z-1s/@/ /g<CR>\WE
map <silent> <Leader>Tsp  \WS:'a,.s/^\(\s*\)\(.*\)/\=submatch(1).substitute(submatch(2),'\s\+','@','g')/<CR>:AlignCtrl mIp0P0p0P0=r @<CR>:'a,.Align<CR>:'y+1,'z-1s/@/ /g<CR>\WE
map <silent> <Leader>T~   \WS:AlignCtrl mIp0P0=r ~<CR>:'a,.Align<CR>:'y,'zs/ \( *\);/;\1/ge<CR>\WE

" character-based left-justified alignment maps
map <silent> <Leader>t| \WS:AlignCtrl mIp0P0=l <Bar><CR>:'a,.Align<CR>\WE
map <silent> <Leader>t#   \WS:AlignCtrl mIp0P0=l #<CR>:'a,.Align<CR>\WE
map <silent> <Leader>t,   \WS:AlignCtrl mIp0P1=l ,<CR>:'a,.Align<CR>\WE
map <silent> <Leader>t:   \WS:AlignCtrl mIp1P1=l :<CR>:'a,.Align<CR>\WE
map <silent> <Leader>t;   \WS:AlignCtrl mIp0P0=l ;<CR>:'a,.Align<CR>:.,'zs/ \( *\);/;\1/ge<CR>\WE
map <silent> <Leader>t<   \WS:AlignCtrl mIp0P0=l <<CR>:'a,.Align<CR>\WE

map <silent> <Leader>t=   \WS:'a,'zs/\s\+\([*/+\-%<Bar>&\~^]\==\)/ \1/e<CR>:'a,'zs@ \+\([*/+\-%<Bar>&\~^]\)=@\1=@ge<CR>'zk:AlignCtrl mIp1P1=l =<CR>:AlignCtrl g =<CR>:'a,.Align<CR>'zk:'a,.s@\([*/+\-%<Bar>&\~^]\)\( \+\)=@\2\1=@ge<CR>'zk:'a,.s/\( \+\);/;\1/ge<CR>'zk:'a,.v/^\s*\/[*/]/s/\/[*/]/@&@/e<CR>:'a,.v/^\s*\/[*/]/s/\*\//@&/e<CR>'zk<Leader>t@:'y,'zs/^\(\s*\) @/\1/e<CR>:'y,'zs/ @//eg<CR>\WE
map <silent> <Leader>t?   \WS:AlignCtrl mIp0P0=l ?<CR>:'a,.Align<CR>:.,'zs/ \( *\);/;\1/ge<CR>\WE
map <silent> <Leader>tab  \WS:'a,.s/^\(\t*\)\(.*\)/\=submatch(1).substitute(submatch(2),'\t','@','g')/<CR>:AlignCtrl mIp0P0=l @<CR>:'a,.Align<CR>:'y+1,'z-1s/@/ /g<CR>\WE
map <silent> <Leader>tsp  \WS:'a,.s/^\(\s*\)\(.*\)/\=submatch(1).substitute(submatch(2),'\s\+','@','g')/<CR>:AlignCtrl mIp0P0=l @<CR>:'a,.Align<CR>:'y+1,'z-1s/@/ /g<CR>\WE
map <silent> <Leader>tt   \WS:AlignCtrl mIp1P1=l & \\\\<CR>:'a,.Align<CR>\WE
map <silent> <Leader>t~   \WS:AlignCtrl mIp0P0=l ~<CR>:'a,.Align<CR>:'y,'zs/ \( *\);/;\1/ge<CR>\WE

" plain Align maps; these two are used in <Leader>acom..\afnc
map <silent> <Leader>t@   :AlignCtrl mIp1P1=l @<CR>:'a,.Align<CR>
map <silent> <Leader>tW@  :AlignCtrl mWp1P1=l @<CR>:'a,.Align<CR>

" Joiner
map <silent> <Leader>jnr=  :call <SID>CharJoiner("=")<CR>
map <silent> <Leader>jnr,  :call <SID>CharJoiner(",")<CR>

" visual-line mode variants
vmap <silent> <Leader>T|	:<BS><BS><BS><CR>ma'><Leader>T|
vmap <silent> <Leader>T,	:<BS><BS><BS><CR>ma'><Leader>T,
vmap <silent> <Leader>T:	:<BS><BS><BS><CR>ma'><Leader>T:
vmap <silent> <Leader>T<	:<BS><BS><BS><CR>ma'><Leader>T<
vmap <silent> <Leader>T=	:<BS><BS><BS><CR>ma'><Leader>T=
vmap <silent> <Leader>T@	:<BS><BS><BS><CR>ma'><Leader>T@
vmap <silent> <Leader>Tsp	:<BS><BS><BS><CR>ma'><Leader>Tsp
vmap <silent> <Leader>a?	:<BS><BS><BS><CR>ma'><Leader>a?
vmap <silent> <Leader>a,	:<BS><BS><BS><CR>ma'><Leader>a,
vmap <silent> <Leader>abox	:<BS><BS><BS><CR>ma'><Leader>abox
vmap <silent> <Leader>acom	:<BS><BS><BS><CR>ma'><Leader>acom
vmap <silent> <Leader>ascom	:<BS><BS><BS><CR>ma'><Leader>ascom
vmap <silent> <Leader>adec	:<BS><BS><BS><CR>ma'><Leader>adec
vmap <silent> <Leader>adef	:<BS><BS><BS><CR>ma'><Leader>adef
vmap <silent> <Leader>afnc	:<BS><BS><BS><CR>ma'><Leader>afnc
vmap <silent> <Leader>t|	:<BS><BS><BS><CR>ma'><Leader>t|
vmap <silent> <Leader>t,	:<BS><BS><BS><CR>ma'><Leader>t,
vmap <silent> <Leader>t:	:<BS><BS><BS><CR>ma'><Leader>t:
vmap <silent> <Leader>t;	:<BS><BS><BS><CR>ma'><Leader>t;
vmap <silent> <Leader>t<	:<BS><BS><BS><CR>ma'><Leader>t<
vmap <silent> <Leader>t=	:<BS><BS><BS><CR>ma'><Leader>t=
vmap <silent> <Leader>t?	:<BS><BS><BS><CR>ma'><Leader>t?
vmap <silent> <Leader>t@	:<BS><BS><BS><CR>ma'><Leader>t@
vmap <silent> <Leader>tab	:<BS><BS><BS><CR>ma'><Leader>tab
vmap <silent> <Leader>tsp	:<BS><BS><BS><CR>ma'><Leader>tsp
vmap <silent> <Leader>tp@	:<BS><BS><BS><CR>ma'><Leader>tp@
vmap <silent> <Leader>tt	:<BS><BS><BS><CR>ma'><Leader>tt
vmap <silent> <Leader>Htd	:<BS><BS><BS><CR>ma'><Leader>Htd

" ---------------------------------------------------------------------

" CharJoiner: joins lines which end in the given character (spaces
"             at end are ignored)
fu! <SID>CharJoiner(chr)
	let aline = line("'a")
	let rep   = line(".") - aline
	while rep > 0
		norm! 'a
		while match(getline(aline),a:chr . "\s*$") != -1
			" while = at end-of-line, delete it and join with next
			norm! 'a$
			j!
			let rep = rep - 1
			endwhile
		" update rep(eat) count
		let rep = rep - 1
		if rep <= 0
			" terminate loop if at end-of-block
			break
			endif
		" prepare for next line
		norm! jma
		let aline = line("'a")
		endwhile
endfunction

" ---------------------------------------------------------------------

" Afnc: useful for splitting one-line function beginnings
"            into one line per argument format
fu! <SID>Afnc()
  " keep display quiet
  let chkeep = &ch
  set ch=2

  " Find beginning of function
  exe "norm! ]]?)\<CR>%my"
  s/(\s*\(\S\)/(\r  \1/e
  exe "norm! `y%"
  s/)\s*\(\/[*/]\)/)\r\1/e
  exe "norm! `y%mz"
  'y,'zs/\s\+$//e
  'y,'zs/^\s\+//e
  'y+1,'zs/^/  /

  " insert newline after every comma only one parenthesis deep
  sil! exe "norm! `y\<right>h"
  let parens   = 1
  let cmmnt    = 0
  let cmmntline= -1
  while parens >= 1
   exe 'norm! ma "ay`a '
   if @a == "("
    let parens= parens + 1
   elseif @a == ")"
    let parens= parens - 1

   " comment bypass:  /* ... */  or //...
   elseif cmmnt == 0 && @a == '/'
    let cmmnt= 1
   elseif cmmnt == 1
	if @a == '/'
	 let cmmnt    = 2   " //...
	 let cmmntline= line(".")
	elseif @a == '*'
	 let cmmnt= 3   " /*...
	else
	 let cmmnt= 0
	endif
   elseif cmmnt == 2 && line(".") != cmmntline
	let cmmnt    = 0
	let cmmntline= -1
   elseif cmmnt == 3 && @a == '*'
	let cmmnt= 4
   elseif cmmnt == 4
	if @a == '/'
	 let cmmnt= 0   " ...*/
	elseif @a != '*'
	 let cmmnt= 3
	endif

   elseif @a == "," && parens == 1 && cmmnt == 0
	exe "norm! i\<CR>\<Esc>"
   endif
  endwhile
  norm! `y%mz%
  sil! 'y,'zg/^\s*$/d

  " perform substitutes to mark fields for Align
  sil! 'y+1,'zv/^\//s/^\s\+\(\S\)/  \1/e
  sil! 'y+1,'zv/^\//s/\(\S\)\s\+/\1 /eg
  sil! 'y+1,'zv/^\//s/\* \+/*/ge
  "                                                 func
  "                    ws  <- declaration   ->    <-ptr  ->   <-var->    <-[array][]    ->   <-glop->      <-end->
  sil! 'y+1,'zv/^\//s/^\s*\(\(\w\+\s*\)\+\)\s\+\([(*]*\)\s*\(\w\+\)\s*\(\(\[.\{-}]\)*\)\s*\(.\{-}\)\=\s*\([,)]\)\s*$/  \1@#\3@\4\5@\7\8/e
  sil! 'y+1,'z+1g/^\s*\/[*/]/norm! kJ
  sil! 'y+1,'z+1s%/[*/]%@&@%ge
  sil! 'y+1,'z+1s%*/%@&%ge
  AlignCtrl mIp0P0=l @
  sil! 'y+1,'zAlign
  sil! 'y,'zs%@\(/[*/]\)@%\t\1 %e
  sil! 'y,'zs%@\*/% */%e
  sil! 'y,'zs/@\([,)]\)/\1/
  sil! 'y,'zs/@/ /
  AlignCtrl mIlrp0P0= # @
  sil! 'y+1,'zAlign
  sil! 'y+1,'zs/#/ /
  sil! 'y+1,'zs/@//
  sil! 'y+1,'zs/\(\s\+\)\([,)]\)/\2\1/e

  " Restore
  let &ch=chkeep
endfunction

" ---------------------------------------------------------------------

" vim: ts=4 nowrap
