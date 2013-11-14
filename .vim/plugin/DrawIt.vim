" DrawIt.vim: a simple way to draw things in Vim -- just put this file in
"             your plugin directory, use \di to start (\ds to stop), and
"             just move about using the cursor keys.
"
"             You may also use visual-block mode to select endpoints and
"             draw lines, arrows, and ellipses.
"
" Last Change: September 19, 2001
" Maintainers:  Charles E. Campbell, Jr.	(Charles.E.Campbell.1@gsfc.nasa.gov)
"               Sylvain VIART					(molo@multimania.com)
"
" NOTE:        this script requires Vim 6.0k (or later)
"
" To Enable: simply put this plugin into your ~/.vim/plugin directory
"
" Usage:  (the backslash is actually whatever your leader character(s) is/are)
"    \di   : start DrawIt
"    \ds   : stop  DrawIt
"    call SetDrawIt('vertical','horizontal','crossing','\','/') :
"            set drawing characters for motions to the
"            |: up/down,
"            -: left/right,
"            +: crossing,
"            \: downright, and
"            /: downleft
"
"            The routines use a replace, move, and replace/insert
"            strategy.  The package also lets one...
"
"   <space>  insert a space (in the direction last moved)
"   >        insert a > and move right    (facilitates the drawing of arrows)
"   <        insert a < and move left
"   ^        insert a ^ and move up
"   v        insert a v and move down
"   <end>    replace with a \, move down and right, and insert a \
"   <pgup>   replace with a \, move up   and left,  and insert a \
"   <pgdn>   replace with a /, move down and left,  and insert a /
"   <home>   replace with a /, move up   and right, and insert a /
"
"   \a : draw arrow from corners of visual-block selected region
"   \b : draw box on visual-block selected region
"   \e : draw an ellipse on visual-block selected region
"   \h : holer : query user for qty, append qty of textwidth-spaced lines under cursor
"   \l : draw line from corners of visual-block selected region
"   \s : spacer: appends spaces up to the textwidth (default: 78)

" Exit quickly when DrawIt has already been loaded or when 'compatible' is set
if exists("loaded_drawit") || &cp
  finish
endif
let loaded_drawit= 1

" Public Interface:
if !hasmapto('<Plug>StartDrawIt')
  map <unique> <Leader>di <Plug>StartDrawIt
endif
if !hasmapto('<Plug>StopDrawIt')
  map <unique> <Leader>ds <Plug>StopDrawIt
endif

" Global Maps:
map <silent> <unique> <script> <Plug>StartDrawIt  :set lz<CR>:call <SID>StartDrawIt()<CR>:set nolz<CR>
map <silent> <unique> <script> <Plug>StopDrawIt   :set lz<CR>:call <SID>StopDrawIt()<CR>:set nolz<CR>

" =====================================================================
" DrawIt ROutines (Charles E. Campbell, Jr.)

" ---------------------------------------------------------------------

" StartDrawIt: this function maps the cursor keys, sets up default
"              drawing characters, and makes some settings
function! <SID>StartDrawIt()
  if exists("b:dodrawit") && b:dodrawit == 1
	" already in DrawIt mode
    echo "[DrawIt]"
	return
  endif

  " indicate in DrawIt mode
  echo "[DrawIt]"

  " set up default drawing characters
  let b:dodrawit= 1
  if !exists("b:cvert")
	let b:cvert= "|"
  endif
  if !exists("b:choriz")
	let b:choriz= "-"
  endif
  if !exists("b:ccross")
	let b:ccross= "+"
  endif
  if !exists("b:cdl")
	let b:cdl= "/"
  endif
  if !exists("b:cdr")
	let b:cdr= "\\"
  endif

  " option recording
  let b:aikeep = &ai
  let b:cinkeep= &cin
  let b:etkeep = &et
  let b:sikeep = &si
  let b:stakeep= &sta
  let b:vekeep = &ve
  set nocin noai nosi sta et ve=""

  " save and unmap user maps
  let mapchx       = "abehls"
  let b:restoremap = ""
  let b:lastdir    = 1
  let i            = 1
  if exists("mapleader")
    let usermaplead  = mapleader
  else
    let usermaplead  = "\\"
  endif
  while i < strlen(mapchx)
	let amap=usermaplead.strpart(mapchx,i-1,1)
	if maparg(amap,"n") != ""
	  let b:restoremap= "map ".amap." ".maparg(amap,"n")."|".b:restoremap
	  exe "unmap ".amap
	endif
	let i= i + 1
  endwhile

  " DrawIt maps (Charles Campbell)
  map <silent> <left>     :set lz<CR>:silent! call <SID>DrawLeft()<CR>:set nolz<CR>
  map <silent> <right>    :set lz<CR>:silent! call <SID>DrawRight()<CR>:set nolz<CR>
  map <silent> <up>       :set lz<CR>:silent! call <SID>DrawUp()<CR>:set nolz<CR>
  map <silent> <down>     :set lz<CR>:silent! call <SID>DrawDown()<CR>:set nolz<CR>
  map <silent> <space>    :set lz<CR>:silent! call <SID>DrawSpace(' ',0)<CR>:set nolz<CR>
  map <silent> >          :set lz<CR>:silent! call <SID>DrawSpace('>',1)<CR>:set nolz<CR>
  map <silent> <          :set lz<CR>:silent! call <SID>DrawSpace('<',2)<CR>:set nolz<CR>
  map <silent> ^          :set lz<CR>:silent! call <SID>DrawSpace('^',3)<CR>:set nolz<CR>
  map <silent> v          :set lz<CR>:silent! call <SID>DrawSpace('v',4)<CR>:set nolz<CR>
  map <silent> <home>     :set lz<CR>:silent! call <SID>DrawSlantUpLeft()<CR>:set nolz<CR>
  map <silent> <end>      :set lz<CR>:silent! call <SID>DrawSlantDownLeft()<CR>:set nolz<CR>
  map <silent> <pageup>   :set lz<CR>:silent! call <SID>DrawSlantUpRight()<CR>:set nolz<CR>
  map <silent> <pagedown> :set lz<CR>:silent! call <SID>DrawSlantDownRight()<CR>:set nolz<CR>

  " set up drawing mode mappings (Sylvain Viart)
  nnoremap <silent> <c-v>      :call <SID>Drag_start()<CR><c-v>
  vmap     <silent> <Leader>a  :<c-u>call <SID>Call_corner('Arrow')<CR>
  vmap     <silent> <Leader>b  :<c-u>call <SID>Call_corner('Box')<cr>
  vmap     <silent> <Leader>e  :<c-u>call <SID>Call_corner('Ellipse')<CR>
  nmap              <Leader>h  :call <SID>Holer()<cr>
  vmap     <silent> <Leader>l  :<c-u>call <SID>Call_corner('DrawPlainLine')<CR>
  vmap     <silent> <Leader>s  :<c-u>call <SID>Spacer(line("'<"), line("'>"))<cr>

  " mouse maps  (Sylvain Viart)
  " start visual-block with s-LastMouse
  nnoremap <silent>  <s-leftmouse> <leftmouse><c-v>
  noremap  <silent>  <LeftDrag>    <LeftDrag>:<c-u>call <SID>Drag_start()<cr>
endfunction

" ---------------------------------------------------------------------

" StopDrawIt: this function unmaps the cursor keys and restores settings
function! <SID>StopDrawIt()
  if !exists("b:dodrawit")
	echo "[DrawIt off]"
	return
  endif
  if b:dodrawit == 0
	return
  endif
  let b:dodrawit= 0
  echo "[DrawIt off]"

  " clean up trailing white space
  silent! %s/\s\+$//

  " unmap DrawIt map interface
  unmap <left>
  unmap <right>
  unmap <up>
  unmap <down>
  unmap <space>
  unmap <
  unmap >
  unmap v
  unmap ^
  unmap <home>
  unmap <end>
  unmap <pageup>
  unmap <pagedown>

  " remove drawing mode maps
  vunmap <Leader>a
  vunmap <Leader>b
  vunmap <Leader>e
  nunmap <Leader>h
  vunmap <Leader>l
  vunmap <Leader>s
  nunmap <s-leftmouse>
  unmap  <c-v>

  " restore user map(s), if any
  if b:restoremap != ""
	exe b:restoremap
	unlet b:restoremap
  endif

  " restore user's options
  let &ai = b:aikeep
  let &cin= b:cinkeep
  let &et = b:etkeep
  let &si = b:sikeep
  let &sta= b:stakeep
  let &ve = b:vekeep
  unlet b:aikeep
  unlet b:cinkeep
  unlet b:etkeep
  unlet b:sikeep
  unlet b:stakeep
  unlet b:vekeep
endfunction

" ---------------------------------------------------------------------

" SetDrawIt: this function allows one to change the drawing characters
function! SetDrawIt(cvert,choriz,ccross,cdr,cdl)
  let b:cvert = a:cvert
  let b:choriz= a:choriz
  let b:ccross= a:ccross
  let b:cdr   = a:cdr
  let b:cdl   = a:cdl
endfunction

" ---------------------------------------------------------------------

" DrawLeft:
function! <SID>DrawLeft()
  let curline   = getline(".")
  let curcol    = col(".")
  let b:lastdir = 2

  if curcol > 0
    let curchar= strpart(curline,curcol-1,1)

    " replace
	if curchar == b:cvert || curchar == b:ccross
	  exe "norm! r".b:ccross
	else
	  exe "norm! r".b:choriz
	endif

	" move and replace
	let curchar= strpart(curline,curcol-2,1)
	if curchar == b:cvert || curchar == b:ccross
	  exe "norm! hr".b:ccross
	else
	  exe "norm! hr".b:choriz
	endif
  endif
endfunction

" ---------------------------------------------------------------------

" DrawRight:
function! <SID>DrawRight()
  let curline   = getline(".")
  let curcol    = col(".")
  let b:lastdir = 1

  " replace
  if col("$") > 1
    let curchar= strpart(curline,curcol-1,1)
    if curchar == b:cvert || curchar == b:ccross
  	  exe "norm! r".b:ccross
	else
  	  exe "norm! r".b:choriz
    endif
  endif

  if col(".") >= col("$")-1
    " move and insert
	exe "norm! A".b:choriz."\<Esc>"
  else
    " move and replace
	let curchar= strpart(curline,curcol,1)
	if curchar == b:cvert || curchar == b:ccross
      exe "norm! lr".b:ccross
	else
      exe "norm! lr".b:choriz
	endif
  endif
endfunction

" ---------------------------------------------------------------------

" DrawUp:
function! <SID>DrawUp()
  let curline   = getline(".")
  let curcol    = col(".")
  let b:lastdir = 3

  " replace
  if curcol > 0
    let curchar= strpart(curline,curcol-1,1)
    if curchar == b:choriz || curchar == b:ccross
	  exe "norm! r".b:ccross
	else
	  exe "norm! r".b:cvert
    endif
  endif

  " move and replace/insert
  if line(".") == 1
	let curcol= curcol - 1
	if curcol == 0 && col("$") == 1
	  exe "norm! i".b:cvert."\<Esc>"
	elseif curcol == 0
	  exe "norm! YP:s/./ /ge\<CR>0r".b:cvert
	else
	  exe "norm! YP:s/./ /ge\<CR>0".curcol."lr".b:cvert
	endif
  else
	norm! k
	while col(".") < curcol
	  " pad line with spaces as needed
	  exe "norm! A \<esc>"
	endwhile
	let curline= getline(".")
	let curchar= strpart(curline,curcol-1,1)
	if curchar == b:choriz || curchar == b:ccross
	  exe "norm! r".b:ccross
	else
	  exe "norm! r".b:cvert
    endif
  endif
endfunction

" ---------------------------------------------------------------------

" DrawDown:
function! <SID>DrawDown()
  let curline   = getline(".")
  let curcol    = col(".")
  let curchar   = strpart(curline,curcol-1,1)
  let b:lastdir = 4

  " replace
  if curcol > 0 && col("$") != 1
    let curchar= strpart(curline,curcol-1,1)
    if curchar == b:choriz || curchar == b:ccross
	  exe "norm! r".b:ccross
	else
	  exe "norm! r".b:cvert
    endif
  endif

  " move and replace/insert
  if line(".") == line("$")
	let curcol= curcol - 1
	if curcol == 0 && col("$") == 1
	  exe "norm! i".b:cvert."\<Esc>"
	elseif curcol == 0
	  exe "norm! Yp:s/./ /ge\<CR>r".b:cvert
	else
	  exe "norm! Yp:s/./ /ge\<CR>0".curcol."lr".b:cvert
	endif
  else
	norm! j
	if col(".") < curcol
	  while col(".") < curcol
	    " pad line with spaces as needed
	    exe "norm! A \<esc>"
	  endwhile
	endif
	let curline= getline(".")
	let curchar= strpart(curline,curcol-1,1)
	if curchar == b:choriz || curchar == b:ccross
	  exe "norm! r".b:ccross
	else
	  exe "norm! r".b:cvert
	endif
  endif
endfunction

" ---------------------------------------------------------------------

" DrawSpace: clear character and move right
function! <SID>DrawSpace(chr,dir)
  let curcol= col(".")

  " replace current location with arrowhead/space
  if curcol == col("$")-1
	exe "norm! r".a:chr
  else
	exe "norm! r".a:chr
  endif

  if a:dir == 0
	let dir= b:lastdir
  else
	let dir= a:dir
  endif

  " perform specified move
  if dir == 1
	call s:MoveRight()
  elseif dir == 2
	call s:MoveLeft()
  elseif dir == 3
	call s:MoveUp()
  else
	call s:MoveDown()
  endif
endfunction

" ---------------------------------------------------------------------

" DrawSlantDownLeft: /
function! <SID>DrawSlantDownLeft()
  let curcol = col(".")

  " replace
  if curcol != col("$")
	exe "norm! r".b:cdl
  else
	exe "norm! i".b:cdl."\<Esc>"
	return
  endif

  " move
  call s:MoveDown()
  call s:MoveLeft()

  " replace
  exe "norm! r".b:cdl
endfunction

" ---------------------------------------------------------------------

" DrawSlantDownRight: \
function! <SID>DrawSlantDownRight()
  let curcol = col(".")

  " replace
  if curcol != col("$")
	exe "norm! r".b:cdr
  else
	exe "norm! i".b:cdr."\<Esc>"
	return
  endif

  " move
  call s:MoveDown()
  call s:MoveRight()

  " replace
  exe "norm! r".b:cdr
endfunction

" ---------------------------------------------------------------------

" DrawSlantUpLeft: shift-\ == |
function! <SID>DrawSlantUpLeft()
  let curcol = col(".")

  " replace
  if curcol != col("$")
	exe "norm! r".b:cdr
  else
	exe "norm! i".b:cdr."\<Esc>"
	return
  endif

  " move
  call s:MoveUp()
  call s:MoveLeft()

  " replace
  exe "norm! r".b:cdr
endfunction

" ---------------------------------------------------------------------

" DrawSlantUpRight: shift-/ == ?
function! <SID>DrawSlantUpRight()
  let curcol = col(".")

  " replace
  if curcol != col("$")
	exe "norm! r".b:cdl
  else
	exe "norm! i".b:cdl."\<Esc>"
	return
  endif

  " move
  call s:MoveUp()
  call s:MoveRight()

  " replace
  exe "norm! r".b:cdl
endfunction

" ---------------------------------------------------------------------

" MoveLeft:
fu! <SID>MoveLeft()
  norm! h
  let b:lastdir= 2
endfunction

" ---------------------------------------------------------------------

" MoveRight:
fu! <SID>MoveRight()
  if col(".") >= col("$") - 1
	exe "norm! A \<Esc>"
  else
	norm! l
  endif
  let b:lastdir= 1
endfunction

" ---------------------------------------------------------------------

" MoveUp:
fu! <SID>MoveUp()
  let curcol= col(".") - 1

  if line(".") == 1
	if curcol == 0 && col("$") == 1
	  exe "norm! i \<Esc>"
	elseif curcol == 0
	  exe "norm! YP:s/./ /ge\<CR>0r "
	else
	  exe "norm! YP:s/./ /ge\<CR>0".curcol."lr "
	endif
  else
	norm! k
	while col(".") <= curcol
	  exe "norm! A \<Esc>"
	endwhile
  endif
  let b:lastdir= 3
endfunction

" ---------------------------------------------------------------------

" MoveDown:
fu! <SID>MoveDown()
  if line(".") == line("$")
	let curcol= col(".") - 1
	if curcol == 0 && col("$") == 1
	  exe "norm! i \<Esc>"
	elseif curcol == 0
	  exe "norm! Yp:s/./ /ge\<CR>r "
	else
	  exe "norm! Yp:s/./ /ge\<CR>0".curcol."lr "
	endif
  else
	let curcol= col(".") - 1
	norm! j
	while col(".") <= curcol
	  exe "norm! A \<Esc>"
	endwhile
  endif
  let b:lastdir= 4
endfunction

" ---------------------------------------------------------------------

" DrawEllipse: Bresenham-like ellipse drawing algorithm
"      2   2      can
"     x   y       be             2 2   2 2   2 2
"     - + - = 1   rewritten     b x + a y = a b
"     a   b       as
"
"     Take step which has minimum error
"     (x,y-1)  (x+1,y)  (x+1,y-1)
"
"             2 2   2 2   2 2
"     Ei = | b x + a y - a b |
"
"     Algorithm only draws arc from (0,b) to (a,0) and uses
"     DrawFour() to reflect points to other three quadrants
func! <SID>Ellipse(x0,y0,x1,y1)
	let x0   = a:x0
	let y0   = a:y0
	let x1   = a:x1
	let y1   = a:y1
	let xoff = (x0+x1)/2
	let yoff = (y0+y1)/2
	let a    = <SID>Abs(x1-x0)/2
	let b    = <SID>Abs(y1-y0)/2
	let a2   = a*a
	let b2   = b*b
	let twoa2= a2 + a2
	let twob2= b2 + b2

	let xi= 0
	let yi= b
	let ei= 0
	call <SID>DrawFour(xi,yi,xoff,yoff,a,b)
	while xi <= a && yi >= 0

		let dy= a2 - twoa2*yi
		let ca= ei + twob2*xi + b2
		let cb= ca + dy
		let cc= ei + dy

		let aca= <SID>Abs(ca)
		let acb= <SID>Abs(cb)
		let acc= <SID>Abs(cc)

		" pick case: (xi+1,yi) (xi,yi-1) (xi+1,yi-1)
		if aca <= acb && aca <= acc
			let xi= xi + 1
			let ei= ca
		elseif acb <= aca && acb <= acc
			let ei= cb
			let xi= xi + 1
			let yi= yi - 1
		else
			let ei= cc
			let yi= yi - 1
		endif
		if xi > a:x1
			break
		endif
		call <SID>DrawFour(xi,yi,xoff,yoff,a,b)
	endw
endf

" ---------------------------------------------------------------------

" DrawFour: reflect a point to four quadrants
func! <SID>DrawFour(x,y,xoff,yoff,a,b)
	let x  = a:xoff + a:x
	let y  = a:yoff + a:y
	let lx = a:xoff - a:x
	let by = a:yoff - a:y
	call <SID>SetCharAt('*',  x, y)
	call <SID>SetCharAt('*', lx, y)
	call <SID>SetCharAt('*', lx,by)
	call <SID>SetCharAt('*',  x,by)
endf

" =====================================================================
"  Drawing Routines (Sylvain VIART)

" fill end of line with space until textwidth.
func! <SID>Spacer(debut, fin)
	let l   = a:debut
	let max = &textwidth
	if max <= 0
		let max= 78
	endif
	while l <= a:fin
		let content = getline(l)
		let long    = strlen(content)
		let i       = long
		let space   = ''
		while i < max
			let space = space . ' '
			let i     = i + 1
		endw
		call setline(l, content.space)
		let l = l + 1
	endw
endf

" ---------------------------------------------------------------------

func! <SID>Holer()
	let nb = input("how many lines under the cursor? ")
	exe "norm ".nb."o\e"
	let fin = line('.')
	call <SID>Spacer(fin-nb+1, fin)
	exe "norm ".(nb-1)."k"
endf

" ---------------------------------------------------------------------

func! <SID>Box(x0, y0, x1, y1)
	" loop each line
	let l = a:y0
	while l <= a:y1
		let c = a:x0
		while c <= a:x1
			if l == a:y0 || l == a:y1
				let remp = '-'
				if c == a:x0 || c == a:x1
					let remp = '+'
				endif
			else
				let remp = '|'
				if c != a:x0 && c != a:x1
					let remp = '.'
				endif
			endif

			if remp != '.'
				call <SID>SetCharAt(remp, c, l)
			endif
			let c  = c + 1
		endw
		let l = l + 1
	endw
endf

" ---------------------------------------------------------------------

" set the character at the specified position (must exist)
func! <SID>SetCharAt(char, x, y)
	let content = getline(a:y)
	let long    = strlen(content)
	let deb     = strpart(content, 0, a:x - 1)
	let fin     = strpart(content, a:x, long)
	call setline(a:y, deb.a:char.fin)
endf

" ---------------------------------------------------------------------

" Bresenham linedrawing algorithm
" taken from :
" http://www.graphics.lcs.mit.edu/~mcmillan/comp136/Lecture6/Lines.html
func! <SID>DrawLine(x0, y0, x1, y1, horiz)

	if ( a:x0 < a:x1 && a:y0 > a:y1 ) || ( a:x0 > a:x1 && a:y0 > a:y1 )
	  " swap direction
	  let x0   = a:x1
	  let y0   = a:y1
	  let x1   = a:x0
	  let y1   = a:y0
	else
	  let x0 = a:x0
	  let y0 = a:y0
	  let x1 = a:x1
	  let y1 = a:y1
	endif
	let dy = y1 - y0
	let dx = x1 - x0

	if dy < 0
		let dy    = -dy
		let stepy = -1
	else
		let stepy = 1
	endif

	if dx < 0
		let dx    = -dx
		let stepx = -1
	else
		let stepx = 1
	endif

	let dy = 2*dy
	let dx = 2*dx

	if dx > dy
		" move under x
		let char = a:horiz
		call <SID>SetCharAt(char, x0, y0)
		let fraction = dy - (dx / 2)  " same as 2*dy - dx
		while x0 != x1
			let char = a:horiz
			if fraction >= 0
				if stepx > 0
					let char = '\'
				else
					let char = '/'
				endif
				let y0 = y0 + stepy
				let fraction = fraction - dx    " same as fraction -= 2*dx
			endif
			let x0 = x0 + stepx
			let fraction = fraction + dy	" same as fraction = fraction - 2*dy
			call <SID>SetCharAt(char, x0, y0)
		endw
	else
		" move under y
		let char = '|'
		call <SID>SetCharAt(char, x0, y0)
		let fraction = dx - (dy / 2)
		while y0 != y1
			let char = '|'
			if fraction >= 0
				if stepy > 0 || stepx < 0
					let char = '\'
				else
					let char = '/'
				endif
				let x0 = x0 + stepx
				let fraction = fraction - dy
			endif
			let y0 = y0 + stepy
			let fraction = fraction + dx
			call <SID>SetCharAt(char, x0, y0)
		endw
	endif
endf

" ---------------------------------------------------------------------

" Arrow:
func! <SID>Arrow(x0, y0, x1, y1)

	call <SID>DrawLine(a:x0, a:y0, a:x1, a:y1,'-')

	let dy = a:y1 - a:y0
	let dx = a:x1 - a:x0
	if <SID>Abs(dx) > <SID>Abs(dy)
		" move x
		if dx > 0
			call <SID>SetCharAt('>', a:x1, a:y1)
		else
			call <SID>SetCharAt('<', a:x1, a:y1)
		endif
	else
		" move y
		if dy > 0
			call <SID>SetCharAt('v', a:x1, a:y1)
		else
			call <SID>SetCharAt('^', a:x1, a:y1)
		endif
	endif

endf

" ---------------------------------------------------------------------

func! <SID>Abs(val)
	if a:val < 0
		return - a:val
	else
		return a:val
	endif
endf

" ---------------------------------------------------------------------

" Drag_start: Read visual drag mapping
" The visual start point is saved in b:x_drag and b:y_drag
" The event <LeftDrag> is send when the window is resized, we must disable
" this feature
func! <SID>Drag_start()
	silent! unmap <LeftDrag>
	let b:x_drag    = col('.')
	let b:y_drag    = line('.')
	let b:winheight = winheight(0)
	noremap <LeftRelease> <LeftRelease>:<c-u>call <SID>Drag_end()<cr>
endf!

" ---------------------------------------------------------------------

func! <SID>Drag_end()
	unmap <LeftRelease>
	noremap <LeftDrag> <LeftDrag>:<c-u>call <SID>Drag_start()<cr>
	if b:winheight == winheight(0)
		norm gv
	endif
endf

" ---------------------------------------------------------------------

" Call_corner: call the specified function with the corner position of
" the current visual selection.
func! <SID>Call_corner(func_name)
	let xdep = b:x_drag
	let ydep = b:y_drag

	let x0 = col("'<")
	let y0 = line("'<")
	let x1 = col("'>")
	let y1 = line("'>")

	if x1 == xdep && y1 ==ydep
		let x1 = x0
		let y1 = y0
		let x0 = xdep
		let y0 = ydep
	endif

"	echo a:func_name.": ".xdep.','.ydep.','.x0.','.y0.','.x1.','.y1
	exe "call <SID>".a:func_name."(".x0.','.y0.','.x1.','.y1.")"

	let b:x_drag= 0
	let b:y_drag= 0
endf

" ---------------------------------------------------------------------

" DrawPlainLine:
func! <SID>DrawPlainLine(x0,y0,x1,y1)
	exe "call <SID>DrawLine(".a:x0.','.a:y0.','.a:x1.','.a:y1.',"_")'
endf

" ---------------------------------------------------------------------
" vim: set ts=3 sw=3:
