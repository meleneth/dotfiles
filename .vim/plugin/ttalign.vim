" Align Text : according to separators
" Version    : 1.11
" Maintainer : Dr. Charles E. Campbell, Jr. <Charles.Campbell@gsfc.nasa.gov>
" Last Change: December 1, 2000
"
" Use 'a to mark beginning of to-be-aligned region,   Alternative:  use v
" move cursor to end of region, and execute map.      (visual mode) to mark
" The maps also set up marks 'y and 'z, and retain    region, execute same map.
" 'a at the beginning of region.                      Uses 'a, 'y, and 'z.
"
" Note: these maps all use the textab program.  For those maps which do
"       alignment on constructs (\acom, \adec, etc), a series of substitutes
"       is used to insert "@" symbols in appropriate locations.  Textab is
"       then used to do alignment on "@" and is then followed by further
"       substitutes to do clean-up.
"
"  \a,   : useful for breaking up comma-separated declarations prior to \adec
"  \acom : useful for aligning comments
"  \adec : useful for aligning declarations
"  \adef : useful for aligning definitions
"  \afnc : useful for aligning ansi-c style functions' argument lists; this function
"          *assumes* that it is aligning arguments only, which are already one per line.
"          It doesn't handle pointers to functions with argument lists (yet).
"  \afn, : useful for changing a one-line function(arg1,arg2) -> function(
"                                                                  arg1,
"                                                                  arg2)
"  \tsp  : use textab to make a blank-based table, get rid of trailing blanks
"  \tt   : useful for LaTeX tabulars  (textab TeX)
"  \tx   : make a left-justifed  alignment on character "x"  (,:<=@ blank |#)
"  \Tx   : make a right-justifed alignment on character "x"  (,:<=@ blank |#)
"
"  \WS   : wrapper start (internal)   Produces a blank line above and
"  \WE   : wrapper end   (internal)   below, marks with 'y and 'z, also lz/unlz mode
map \WS   :set lz<CR>o<Esc>mz'aO<Esc>:let ch=&ch<CR>:set ch=24<CR>my'zk
map \WE   'yjmakdd'zdd:%s/\s\+$//e<CR>:exe "set ch=".ch<CR>:unlet ch<CR>:set nolz<CR>

" complex C-code alignment maps
map \a,   \WS:'y,'zs/\(.\)\s\+/\1 /g<CR>'yjma'zk\jnr,<CR>:'y,'zg/,/let @x=substitute(getline(line(".")),"^\\(.\\{-}\\) \\S\\+\\s*,.*$","s/,/;<C-V><C-V><C-V><CR>\\1 /g","")<Bar>@x<CR>\WE
map \acom \WS:'a,.s/\/[*/]/@&@/e<CR>:'a,.s/^@//e<CR>:'a,.s/\*\//@&/e<CR>'zk\tp@:'y,'zs/^\(\s*\) @/\1/e<CR>:'y,'zs/ @//eg<CR>\WE
map \adec \WS:'a,'zs/\([^ \t/]\)\([*&]\)/\1 \2/e<CR>:'a,'zs/\/\*\\|\/\//<C-V><C-M>&/e<CR>:'y,'zv/^\//s/\([^ \t]\)\s\+/\1 /eg<CR>:'y,'zv/^\//s/\([*&]\) \+/\1/ge<CR>:'y,'zg/^\//norm kJ<CR>:'y,'zs/^\([^=*&[]* \)\([*(&]*\)\([a-zA-Z0-9_()]\+\) *\(\(\[.\{-}]\)*\) *\(=\)\= *\(.\{-}\)\= *;/\1@\2#@\3\4@\6@\7;@/e<CR>:'y,'zs/\*\/\s*$/@*\//e<CR>:'y,'zs/^\s\+\*/@@@@@* /e<CR>:'y,'zs/^@@@@@\*\(.*[^*/]\)$/&@*/e<CR>'yjma'zk\t@:'y,'zs/@ //ge<CR>:'y,'zs/\(\s*\);/;\1/e<CR>:'y,'zs/# //e<CR>:'y,'zv/^\s\+\*/s/\([^/*]\)\(\*\+\)\( \+\)/\1\3\2/e<CR>:'y,'zv/^\s\+\*/s/\((\+\)\( \+\)\*/\2\1*/e<CR>:'y,'zs/^\(\s\+\) \*/\1*/e<CR>:'y,'zs/[ \t@]*$//e<CR>\WE
map \adef \WS:'a,.s/^\(\s*\)#\(\s\)*define\s*\(\I[a-zA-Z_0-9(),]*\)\s*\(.\{-}\)\($\<Bar>\/\*\)/#\1\2define @\3@\4@\5/e<CR>:'a,.s/\($\<Bar>\*\/\)/@&/e<CR>'zk\t@'yjma'zk:'a,.s/ @//g<CR>\WE
map \afnc \WS:'y+1,'z-1s/\/\*\\|\/\//<C-V><C-M>&/e<CR>:'y,'zv/^\//s/^\s\+\(\S\)/  \1/e<CR>:'y,'zv/^\//s/\([^ \t/]\)\*/\1 */e<CR>:'y,'zv/^\//s/\(\S\)\s\+/\1 /eg<CR>:'y,'zv/^\//s/\* \+/*/ge<CR>:'y,'zv/^\//s/^\([^=*[]* \)\([*(]*\)\([a-zA-Z0-9_()]\+\) *\(\(\[.\{-}]\)*\) *\(=\)\= *\(.\{-}\)\= *\([,)]\)\s*$/\1@\2#@\3\4@\6@\7\8@/e<CR>'yjma'zk\t@:'y,'zs/^\s\+\//\//e<CR>:'y,'zv/^\//s/@ //ge<CR>:'y,'zv/^\//s/\(\s*\)\([,)]\)/\2\1/e<CR>:'y,'zv/^\//s/# //e<CR>:'y,'zv/^\//s/\([^/*]\)\(\*\+\)\( \+\)/\1\3\2/e<CR>:'y,'zv/^\//s/[ \t@]*$//e<CR>:'y,'zv/^\//s/\s\+{/<C-V><C-M>{/e<CR>:'y,'zv/^\//s/\s\+\([,){]\)\s*$/\1/e<CR>:'y+1,'z-1g/^\//norm kJ<CR>:'y,'zs/\/[*/]/@&@/e<CR>:'y,'zs/^@//e<CR>:'y,'zs/\*\//@&/e<CR>'yjma'zk\tp@:'y,'zs/^\(\s*\) @/\1/e<CR>:'y,'zs/ @//eg<CR>:'y,'zs/\s\+,/,/ge<CR>\WE
map \afn, :call AfncComma()<CR>

" html table alignment
map \Htd  \WS:'y,'zs/> \+</></g<CR>:'y,'zs/\(<TR>\<Bar><\/TD>\)<TD.\{-}>\<Bar><\/\=TD><\/TR>/<Bar>&<Bar>/g<CR>'yjma'zk0!'atextab -s\!\!<CR>:'y,'zs/ <Bar>//ge<CR>:'y,'zs/ <\/TR>/<\/TR>/e<CR>\WE

" character-based alignment maps (T:right sided, t:left sided)
map \T| \WS0!'atextab -r -s\!\!<CR>\WE
map \T#   \WS0!'atextab -r -s\#<CR>\WE
map \T,   \WS0!'atextab -r -s,<CR>\WE
map \T:   \WS0!'atextab -r -s:<CR>\WE
map \T;   \WS0!'atextab -r "-s;"<CR>\WE
map \T<   \WS0!'atextab -r -s<<CR>\WE
map \T=   \WS0!'atextab -r "-fs="<CR>:'y,'zs@\(\S\+\)\([*/+\-%<Bar>&\~^]\) =@ \1\2=@ge<CR>\WE
map \T@   \WS0!'atextab -r -s@<CR>\WE
map \Tsp  \WS:'a,.s/\s\+/ /g<CR>0!'atextab -r "-s "<CR>\WE
map \T~   \WS0!'atextab -r -s~<CR>\WE
map \t| \WS0!'atextab -s\!\!<CR>\WE
map \t,   \WS0!'atextab -s,<CR>\WE
map \t:   \WS0!'atextab -s:<CR>\WE
map \t#   \WS0!'atextab -s\#<CR>\WE
map \t;   \WS0!'atextab "-s;"<CR>:.,'zs/ \( *\);/;\1/ge<CR>\WE
map \t~   \WS0!'atextab "-s~"<CR>:.,'zs/ \( *\);/;\1/ge<CR>\WE
map \t<   \WS0!'atextab -s<<CR>\WE
map \t=   \WS:'a,'zs/\s\+\([*/+\-%<Bar>&\~^]\==\)/ \1/e<CR>:'a,'zs@ \+\([*/+\-%<Bar>&\~^]\)=@\1=@ge<CR>'zk:'a,.s/; *$/;\$Z\$/e<CR>'zk0!'atextab "-fs;="<CR>ma'zk:'a,.s/  *\$Z\$//e<CR>'zk:'a,.s@\([*/+\-%<Bar>&\~^]\)\( \+\)=@\2\1=@ge<CR>'zk:'a,.s/\( \+\);/;\1/ge<CR>\WE
map \t?   \WS0!'atextab "-s?"<CR>:.,'zs/ \( *\);/;\1/ge<CR>\WE
map \tsp  \WS:'a,.s/\s\+/ /g<CR>0!'atextab "-s "<CR>\WE
map \tt   \WS0!'atextab<CR>\WE

" Joiner
map \jnr=  :call CharJoiner("=")<CR>
map \jnr,  :call CharJoiner(",")<CR>

" plain textab maps; these two are used in \acom..\afnc
map \t@   0!'atextab -s@<CR>
map \tp@  0!'atextab -ps@<CR>

" visual-line mode variants
vmap \T| 	:<BS><BS><BS><CR>ma'><Esc>\T|
vmap \T,   	:<BS><BS><BS><CR>ma'><Esc>\T,
vmap \T:   	:<BS><BS><BS><CR>ma'><Esc>\T:
vmap \T<   	:<BS><BS><BS><CR>ma'><Esc>\T<
vmap \T=   	:<BS><BS><BS><CR>ma'><Esc>\T=
vmap \T@   	:<BS><BS><BS><CR>ma'><Esc>\T@
vmap \Tsp  	:<BS><BS><BS><CR>ma'><Esc>\Tsp
vmap \a, 	:<BS><BS><BS><CR>ma'><Esc>\a,
vmap \acom 	:<BS><BS><BS><CR>ma'><Esc>\acom
vmap \adec 	:<BS><BS><BS><CR>ma'><Esc>\adec
vmap \adef 	:<BS><BS><BS><CR>ma'><Esc>\adef
vmap \afnc 	:<BS><BS><BS><CR>ma'><Esc>\afnc
vmap \afn, 	:<BS><BS><BS><CR>ma'><Esc>\afn,
vmap \t| 	:<BS><BS><BS><CR>ma'><Esc>\t|
vmap \t,   	:<BS><BS><BS><CR>ma'><Esc>\t,
vmap \t:   	:<BS><BS><BS><CR>ma'><Esc>\t:
vmap \t;   	:<BS><BS><BS><CR>ma'><Esc>\t;
vmap \t<   	:<BS><BS><BS><CR>ma'><Esc>\t<
vmap \t=   	:<BS><BS><BS><CR>ma'><Esc>\t=
vmap \t?   	:<BS><BS><BS><CR>ma'><Esc>\t?
vmap \t@   	:<BS><BS><BS><CR>ma'><Esc>\t@
vmap \tsp  	:<BS><BS><BS><CR>ma'><Esc>\tsp
vmap \tp@  	:<BS><BS><BS><CR>ma'><Esc>\tp@
vmap \tt   	:<BS><BS><BS><CR>ma'><Esc>\tt
vmap \Htd  	:<BS><BS><BS><CR>ma'><Esc>\Htd

" ---------------------------------------------------------------------

" CharJoiner: joins lines which end in the given character (spaces
"             at end are ignored)
function! CharJoiner (chr)
	let aline = line("'a")
	let rep   = line(".") - aline
	while rep > 0
		normal 'a
		while match(getline(aline),a:chr . "\s*$") != -1
			" while = at end-of-line, delete it and join with next
			normal 'a$
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
		normal jma
		let aline = line("'a")
		endwhile
endfunction

" ---------------------------------------------------------------------

" AfncComma: useful for splitting one-line function beginnings
"            into one line per argument format
fu! AfncComma()
 exe "norm ]]?)\<CR>"
 norm %my
 exe 's/(\(.\)/(\r  \1/e'
 exe "norm \<right>h"
 let parens=1
 while parens >= 1
  exe 'norm ma "ay`a '
  if @a == "("
    let parens= parens + 1
  elseif @a == ")"
    let parens= parens - 1
  elseif @a == "," && parens == 1
	exe "norm i\<CR>\<Esc>"
  endif
 endwhile
 exe "norm o\<Esc>"
 'y,.g/^$/d
 exe "norm [[?)\<CR>% ma\<left>%"
endfunction

" ---------------------------------------------------------------------

