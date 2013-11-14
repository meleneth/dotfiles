version 6.0
" See ":help version" to see why this command is in the first line.
"
" Let people know that they are using this setup file:
" echo "Welcome to Sven's setup file for all users!"
"
"
" ==================================================================
" File:         $HOME/.vimrc.forall  (sourced by ~USER/.vimrc)
" Last update:  Wed Oct 03 13:00:00 MEST 2001
" Purpose:      Setup file for the editor Vim (Vi IMproved)
" Availability: This file is available as
"    27K        <URL:http://www.math.fu-berlin.de/~guckes/setup/vimrc.gz>
"    76K        <URL:http://www.math.fu-berlin.de/~guckes/setup/vimrc>
"               <URL:http://www.vim.org/rc> (mirror)
" Size:         This file is about 76K in size and has 2,000+ lines.
" Author:       Sven Guckes guckes@vim.org (guckes@math.fu-berlin.de)
"               <URL:http://www.math.fu-berlin.de/~guckes/sven/>
" Related files:
"               http://www.math.fu-berlin.de/~guckes/vim/src/emacs.vim
"               http://www.math.fu-berlin.de/~guckes/vim/src/latex.vim
"               http://www.math.fu-berlin.de/~guckes/vim/src/html.vim
"               http://www.math.fu-berlin.de/~guckes/vim/syntax/
" ===================================================================
" NOTE:  If your read this then please send me an email!
" I welcome all feedback on this file - especially
" with new ideas such as abbreviations and mappings.
" Thanks!  And enjoy Vim!  :-)
" --Sven guckes@vim.org and guckes-vimrc@math.fu-berlin.de
" ===================================================================
" Webpages on Vim that you should know about:
" http://www.vim.org/                   Vim Home Page (actually a mirror)
" http://www.vim.org/announce/          Vim Announcements
" http://www.vim.org/bina.html          sites with vim binaries
" http://www.vim.org/bugs.html          Some Vim Bugs
" http://www.vim.org/cvs.html           CVS server
" http://www.vim.org/deve.html          Current development issues
" http://www.vim.org/dist.html          All mirrors in detail
" http://www.vim.org/faq/               Vim FAQ
" http://www.vim.org/hist.html          History of ChangeLogs
" http://www.vim.org/html/              Vim Helptexts in HTML
" http://www.vim.org/howto/             Vim HowTo Texts
" http://www.vim.org/iccf/              Vim and the ICCF (see ":help iccf")
" http://www.vim.org/lang.html          Language/SyntaxFile Summary
" http://www.vim.org/macs.html          Vim on MacOS development
" http://www.vim.org/mail.html          Mailing lists and all that
" http://www.vim.org/mirrors.html       All mirror sites (ftp and www)
" http://www.vim.org/news.html          NEWS about Vim and the pages
" http://www.vim.org/newsgroup.html     Vim on comp.editors
" http://www.vim.org/orga.html          vim.org background info
" http://www.vim.org/pics.html          Pictures: buttons,icons,screenshots
" http://www.vim.org/press/             Articles on Vim in Magazines
" http://www.vim.org/quotes.html        Quotes on Vim by users
" http://www.vim.org/sites.html         Sites that use Vim officially
" http://www.vim.org/syntax/            Syntax files from current version
" http://www.vim.org/syntax.new/        New Syntax files (not yet in distrib)
" http://www.vim.org/user.html          Vim Users and their pages on Vim
" http://www.vim.org/wish.html          Wishlist for new features
" http://www.vim.org/why.html           Why to use a vi clone (Vim!)
" http://www.vim.org/y2k.html           Y2K issues (as if there are any..)
" ===================================================================
" Info on the latest versions of Vim are on the Vim Home Page:
"   http://www.vim.org/
" Mind you, those pages are a *mirror* of the pages at
"   http://www.math.fu-berlin.de/~guckes/vim/
" ===================================================================
" The latest versions of Vim are usually in my signature file:
" http://www.math.fu-berlin.de/~guckes/sig/SIGS  Comments?
" ===================================================================
" Installation of this setup file:
"  To use this setup file, copy it to
"  this filename    on these systems:
"    ~/.vimrc       Unix and OS/2
"    s:.vimrc       Amiga
"    $VIM\_vimrc    MS-DOS and Win32
" ===================================================================
" version check:
" The first line of this setup file contains the information
" "version xxx" which allows VIM to check whether the setup file
" fits the syntax that it understands.
" Versions of VIM other than of version 5 then will give a warning
" as they do not understand this setup file command - a feature:
" Give a warning so the user knows that there is something odd
" about the setup file.
" ===================================================================
" ===================================================================
" Structure of this file:
" Lines starting with an inverted comma (") are comments.
" Some mappings are commented out.  Remove the comment to enable them.
"
" There are three kinds of things which are defined in this file:
" Mapping ("map"), settings ("set"), and abbreviations ("ab").
"   Settings affect the behaviour of commands.
"   Mappings maps a key sequence to a command.
"   Abbreviations define words which are replaced
"   right *after* they are typed in.
"
" ===================================================================
" Note on mappings - "angle notation" (see ":help <>"):
" VIM allows you to define mappings with special characters
" with a notation that uses non-special characters:
" The notation encloses decriptive words in angle brackets (<>).
" The characters you will most often are:
" <C-M> for control-m
" <C-V> for control-v which quotes the following character
" <ESC> for the escape character.
" All control characters have been replaced to use the angle notation
" so you should be able to read this file without problems.
" (Well, sometimes I leave some tabs [control-i] in the file. ;-)
" ===================================================================
" External programs:
" Some mappings make use of external programs.
" The following you should find/have on every UNIX system:
" cut, date; awk, egrep, grep, ispell, perl, sed.
" If you are using DOS then you should get these for you system!!
" See http://www.math.fu-berlin.de/~guckes/dos/ for some pointers!
" ===================================================================
" Online Help - jump to help positions with "\\":
" On some keyboards you will have some trouble with C-],
" the command to jump to the current help tag.
" The following mapping allows to use "\\", too:
  map \\  <C-]>
" ===================================================================
" The command ":version" does not show the current value of
" VIMRUNTIME - dang!  So I need a fast way to display that value:
  map :V :echo $VIMRUNTIME<c-m>
" ===================================================================
" ===================================================================
" HTML - HTML - HTML - HTML - HTML - HTML - HTML - HTML
" ===================================================================
" This has become quite big - so I moved it out to another file:
" http://www.math.fu-berlin.de/~guckes/vim/source/html.vim [980227]
" The "expand" is necessary to evaluate "~guckes".
  let FILE=expand("~guckes/.P/vim/source/html.vim")
  if filereadable(FILE)
     exe "source " . FILE
  endif
" ===================================================================
"
" ===================================================================
" SETTING OPTIONS
" ===================================================================
" There are many options for Vim - over 200.   Here is an overview:
" http://www.vim.org/options54.txt   VIM-5.4   [990726] 218 options.
" http://www.vim.org/options57.txt   VIM-5.7   [000624] 219 options.
" http://www.vim.org/options60ae.txt VIM-6.0ae [010504] 283 options.
" ===================================================================
"
"       autoindent, paste, textwidth:
"       I keep changing these values - just as the case may be.
"       Now, if functions keys actually worked on all keyboards
"       then I'd probably defines a toggle for each of them...
"
"       autoindent:  "off" as I usually do not write code.
  set noautoindent
"
"       autowrite: Automatically save modifications to files
"       when you use critical (rxternal) commands.
  set   autowrite
"
"       backup:  backups are for wimps  ;-)
  set nobackup
"
"       backspace:  '2' allows backspacing" over
"       indentation, end-of-line, and start-of-line.
"       see also "help bs".
  set   backspace=2
"
"       background:  Are we using a "light" or "dark" background?
" set   background=dark
"
"       compatible:  Let Vim behave like Vi?  Hell, no!
  set nocompatible
"
"       comments default: sr:/*,mb:*,el:*/,://,b:#,:%,:XCOMM,n:>,fb:-
  set   comments=b:#,:%,fb:-,n:>,n:)
"
"       cpoptions you should get to know - source of many FAQs!  ;-)
"       cpoptions:  "compatible options" to match Vi behaviour
" set   cpoptions="aABceFs"   "default!
"       FAQ:  Do NOT include the flag '<' if you WANT angle notation!
"
"       dictionary: english words first
  set   dictionary=/usr/dict/words,/local/lib/german.words
"       Source for dictionaries (in unix-format):
"       ftp://ftp.fu-berlin.de/misc/dictionaries/unix-format/
"       However, these are quite old.  Is there a better source?
"
"       digraph:    required for those umlauts
  set   digraph
"
"       errorbells: damn this beep!  ;-)
  set noerrorbells
"
"       esckeys:    allow usage of cursor keys within insert mode
"       You will find this useful when working, eg, on SunOS.
  set   esckeys
"
" In case you want this for SunOS only:
" if system('uname')=='SunOS'
"   set ek
" endif
"       expandtab:  Expand Tabs?  Rather not.
"                   See 'listchars' to make Tabs visible!
  set noexpandtab
"
"       formatoptions:  Options for the "text format" command ("gq")
"                       I need all those options (but 'o')!
  set   formatoptions=cqrt
"
"       helpheight: zero disables this.
  set   helpheight=0
"
"       helpfile:  path+filename of the main helpfile, ie "help.txt"
" set   helpfile=c:\\vim-4.6\\docs\\help.txt
" set   helpfile=c:/vim-4.6/docs/help.txt
" On Windows, I put the Vim helpfiles
" into the directory C:\VIM-version, eg C:\VIM-60ab
"
" Support users of old vim versions on the local net:
  if version==507
    set helpfile=/import/Mweb/guckes/vim/doc/help.txt
  endif
"
" For use from a WindowsNT machine which mounts
" the user's home directory on drive 'Z':
" if has("dos16") || has("dos32") || has("gui_w32")
"   set helpfile=Z:\share\vim\runtime\doc\help.txt
" endif
"
"       hidden:  Allow "hidden" buffers.  A must-have!
  set   hidden
"
"       highlight=8b,db,es,hs,mb,Mn,nu,rs,sr,tb,vr,ws
  set   highlight=8r,db,es,hs,mb,Mr,nu,rs,sr,tb,vr,ws
"
"       hlsearch :  highlight search - show the current search pattern
"       This is a nice feature sometimes - but it sure can get in the
"       way sometimes when you edit.
  set nohlsearch
"
"       icon:       ...
  set noicon
"
" set   iconstring  file of icon (icons?  on a terminal?  pff!)
" set   iconstring
"
"       ignorecase:  ignore the case in search patterns?  NO!
  set noignorecase
"
"       insertmode:
" FAQ:  Q: How can I quit insertmode when using this option?
"       A: The option "insertmode" was not meant for "start Vim in
"       insert mode" only; the idea is to *stay* in insert mode.
"       Anyway, you can use the command |i_CTRL-O| to issue commands.
  set noinsertmode
"
"
"       iskeyword:
"       iskeyword=@,48-57,_,192-255   (default)
" Add the dash ('-'), the dot ('.'), and the '@' as "letters" to "words".
" This makes it possible to expand email and html addresses,
" eg guckes-www@vim.org and http://www.vim.org/
  set   iskeyword=@,48-57,_,192-255,-,.,:,/,@-@
"
"       joinspaces:
"       insert two spaces after a period with every joining of lines.
"       I like this as it makes reading texts easier (for me, at least).
  set   joinspaces
"
"       keywordprg:  Program to use for the "K" command.
" set   keywordprg=man\ -s
"
"       laststatus:  show status line?  Yes, always!
"       laststatus:  Even for only one buffer.
  set   laststatus=2
"
" [VIM5]lazyredraw:  do not update screen while executing macros
  set   lazyredraw
"
"       'list' + 'listchars': Great new feature of vim-5.3!
"       This tells Vim which characters to show for expanded TABs,
"       trailing whitespace, and end-of-lines.  VERY useful!!
" Standard settings:
" set   list
" set   listchars=tab:>-,trail:�,eol:$
"
" However: The '$' at the end of lines is a bit too much, though.
" And I quite like the character that shows a dot in the middle:
" set   listchars=tab:>�,trail:�
"
" Some people might prefer a double right angle (>>)
" to show the start of expanded tabs, though:
" set   listchars=tab:��,trail:�
"
" However, this all breaks up when viewing high-bit characters
" through some brain-dead telnet program (there are many).
" Sometimes a change of the font does the trick.  Try it!
"
"       magic:  Use 'magic' patterns  (extended regular expressions)
"       in search patterns?  Certainly!  (I just *love* "\s\+"!)
  set   magic
"
"       modeline:    ...
"       Allow the last line to be a modeline - useful when
"       the last line in sig gives the preferred textwidth for replies.
  set   modeline
  set   modelines=1
"
"       number:      ...
  set nonumber
"
"       path:   The list of directories to search when you specify
"               a file with an edit command.
"               Note:  "~/.P" is a symlink to my dir with www pages
"               "$VIM/syntax" is where the syntax files are.
" set   path=.,,~/.P/vim,~/.P/vim/runtime/syntax,~/.P/vim/source,$VIM/syntax/
" set   path=.,,~/.P/vim,~/.P/mutt/,~/.P/elm,~/.P/slrn/,~/.P/nn
"
"       pastetoggle
  if version>=508
  set   pastetoggle=<f11>
  endif
"
"       report: show a report when N lines were changed.
"               report=0 thus means "show all changes"!
  set   report=0
"
"       ruler:       show cursor position?  Yep!
  set   ruler
"
"     runtimepath: list of dirs to search for runtime files
"     runtimepath is for Vim-6 only!
if version>=600
  set runtimepath=~/.vim,~/.vim/after
  set runtimepath+=~guckes/.vim
  set runtimepath+=~guckes/share/vim/runtime/
  set runtimepath+=~guckes/share/vim/
  set runtimepath+=~guckes/.P/Vim/syntax
  set runtimepath+=~guckes/share/vim/vim60ao/
endif
" had to set this now that Vim won't use "helpfiles"
" to look for runtime files any more.
"
" Setting the "shell" is always tricky - especially when you are
" trying to use the same vimrc on different operatin systems.
"       shell for DOS
" set   shell=command.com
"       shell for UNIX -  math.fu-berlin.de BSD
" set   shell=zsh
"       shell for UNIX -   inf.fu-berlin.de BSD&Solaris
" set   shell=zsh
"       shell for UNIX - zedat.fu-berlin.de BSD&Solaris
" set   shell=/bin/tcsh
" Now that vim-5 has ":if" I am trying to automate the setting:
"
  if has("dos16") || has("dos32")
    let shell='command.com'
  endif
" gui_w32:  cmd.exe
"
" The zsh is now available at zedat.fu-berlin.de!  :-)
" start the zsh as a login shell:
  if has("unix")
    let &shell="zsh\ -l"
  endif
"
"       shiftwidth:  Number of spaces to use for each
"                    insertion of (auto)indent.
" set   shiftwidth=8
  set   shiftwidth=2
"
"       shortmess:   Kind of messages to show.   Abbreviate them all!
"          New since vim-5.0v: flag 'I' to suppress "intro message".
  set   shortmess=at
"
"       showcmd:     Show current uncompleted command?  Absolutely!
  set   showcmd
"
"       showmatch:   Show the matching bracket for the last ')'?
  set   showmatch
"
"       showmode:    Show the current mode?  YEEEEEEEEESSSSSSSSSSS!
  set   showmode
"
"       suffixes:    Ignore filename with any of these suffixes
"                    when using the ":edit" command.
"                    Most of these are files created by LaTeX.
  set   suffixes=.aux,.bak,.dvi,.gz,.idx,.log,.ps,.swp,.tar
"
"       startofline:  no:  do not jump to first character with page
"       commands, ie keep the cursor in the current column.
  set nostartofline
"
"       splitbelow:  Create new window below current one.
  set   splitbelow
"
"       statusline:  customize contents of the windows' status line.
"       I prefer it this way:
"       Show the current buffer number and filename with info on
"       modification, read-only, and whether it is a help buffer
"       (show only when applied).
" set   statusline=[%n]\ %f\ %(\ %M%R%H)%)
"
"       Move the rest to the right side, eg a copyright text:
" set   statusline=[%n]\ %f\ %(\ %M%R%H)%)%=(c)\ Sven\ Guckes
"
"       Show the value of the current character in ASCII and Hex:
" set   statusline=[%n]\ %f\ %(\ %M%R%H)%)\=ASCII=%b\ HEX=%B
"
"       Show the current position with line+column+virtual_column:
" set   statusline=[%n]\ %f\ %(\ %M%R%H)%)\=Pos=<%l\,%c%V>\ %P
"       Adding color through UserN groups:
" set   statusline=%1*[%02n]%*\ %2*%F%*\ %(\ %M%R%H)%)%=%3*Pos=<%l,%c%V>%*
"       User1: color for buffer number
" hi    User1 ctermfg=red   ctermbg=white
"       User2: color for filename
" hi    User2 ctermfg=green ctermbg=white
" hi    User2 ctermfg=green ctermbg=black
"       User3: color for position
" hi    User3 ctermfg=blue  ctermbg=white
"
"       tabstop
  set   tabstop=8
"
" 990503: I have to set the "term" explicitly
" because the standard setups are broken.
" set   term=builtin_pcansi
" set   term=xterm
"
" Set the colors for vim on "xterm"
" if &term=="xterm"
" set t_Co=8
" set t_AB=[%?%p1%{8}%<%t%p1%{40}%+%e%p1%{92}%+%;%dm
" set t_AF=[%?%p1%{8}%<%t%p1%{30}%+%e%p1%{82}%+%;%dm
" endif
"
"       textmode:    no - I am using Vim on UNIX!
" set notextmode
"
"       textwidth
  set   textwidth=79
"
"       title:
  set notitle
"
"       ttyfast:     are we using a fast terminal?
"                    seting depends on where I use Vim...
  set nottyfast
"
"       ttybuiltin:
  set nottybuiltin
"
"       ttyscroll:      turn off scrolling -> faster!
  set   ttyscroll=0
"
"       ttytype:
" set   ttytype=rxvt
"
"       viminfo:  What info to store from an editing session
"                 in the viminfo file;  can be used at next session.
  set   viminfo=%,'50,\"100,:100,n~/.viminfo
"
"       visualbell:
  set   visualbell
"
"       t_vb:  terminal's visual bell - turned off to make Vim quiet!
"       Please use this as to not annoy cow-orkers in the same room.
"       Thankyou!  :-)
  set   t_vb=
"
"       whichwrap:
"       Allow jump commands for left/right motion to wrap to previous/next
"       line when cursor is on first/last character in the line:
  set   whichwrap=<,>,h,l,[,]
"
"       wildchar  the char used for "expansion" on the command line
"                 default value is "<C-E>" but I prefer the tab key:
  set   wildchar=<TAB>
"
"       wrapmargin:
  set   wrapmargin=1
"
"       writebackup:
  set nowritebackup
"
" ===================================================================
" ABbreviations
" ===================================================================
" 980701: Moved the abbreviations *before* the mappings as
" some of the abbreviations get used with some mappings.
"
" Abbreviations for some important numbers:
  iab Npi 3.1415926535897932384626433832795028841972
  iab Ne  2.7182818284590452353602874713526624977573
"
" Abbreviations for some classic long words:
"     Donau... is the German word for the (read in reverse)
"     "additional paragraph of the law regulating the pension of
"      widows to captains of the ship company on (the river) Danube"
"     (I am not making this up! ;-)
  iab YDD Donaudampfschifffahrtgesellschaftskapitaenwitwenrentengesetzzusatzparagraph
" New German spelling "schifffahrt", too! (Hi, Doram!)
"
" 010131
  iab YTNGV Telekommunikationsnummerngebuehrenverordnung
" 010131
" iab YRRAG Rinderkennzeichnungs- und \
"     Rindfleischetikettierungs�berwachungsaufgaben�bertragungsgesetz (RkRe�A�G)
"
" Some more weird sentences in KrautLang:
" "J�rg m�chte f�nf Fr�hst�cksbr�tchen
"  um �u�erstes V�llegef�hl zu sp�ren."
" "��en L�wen M�wen, z�gen M�wen �ber L�wen r�ber."
" "��e �ko-J�rg gro�e B�renf��e in �u�erst s��er Nu��lk�seso�e
"  m��te er in ein �berm��ig h��liches G�llefa�."
  iab YHRA "Heiz�lr�cksto�abd�mpfung"
" all three umlauts and the '�', too!
" Yes, KrautLang *is* weird!
"
"     YLL : The name of a town in Wales.  I am not making this up!
  iab YLL    LLanfairpwllgwyngyllgogerychwyrndrobwllllantysiliogogogoch
" http://www.llanfairpwllgwyngyllgogerychwyrndrobwllllantysiliogogogoch.co.uk
" http://194.159.85.168/ - I am not making this up!  :-)
"
"     YTauma: The name of a hill in New Zealand.
  iab YTauma Taumatawhakatangihangakoauauotamateaturipukakapikimaungahoronukupokaiwenuakitanatahu
"
" Longest Word in the second edition of the Oxford English Dictionary?
  iab YNNMSVC pneumonoultramicroscopicsilicovolcanoconiosis
"
"     Yalpha : The lower letter alphabet.
  iab Yalpha abcdefghijklmnopqrstuvwxyz
"
"     YALPHA : The upper letter alphabet.
  iab YALPHA ABCDEFGHIJKLMNOPQRSTUVWXYZ
"
"     Ydigit: The ten digits.
  iab Ydigit  1234567890
"
"     Yruler: A "ruler" - nice for counting the length of words.
  iab Yruler  1234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890
"
"     Yupsidedown : This describes people from "down under" (Hi, Dean!).
  iab Yupsidedown umop-ap!sdn
"
"     Ysuper: A nice long word from the musical "Mary Poppins".
  iab Ysuper supercalifragilisticexpialidocious
"
"     Yanti:  The longest proper word in the English language?!
  iab Yanti   antidisestablishmentarianism
"
"     Ypass:  Standard answer to Usenet posts
"             with the "Subject: HELP"  (hehe)
  iab Ypass  "You are in a maze of twisty little passages, all alike."
"
"     Yicty:  Some people should really RTFM!
  iab Yicty   I could tell you - but then I'd have to kill you.
"
"     Ybtdt:  It's been dejavu all over again.
  iab Ybtdt   Been there, done that, got the tshirt.
"
"     Ywttc:  One more person using Vim.
  iab Ywttc   Welcome to the club!
"
"     Ysesqui: "Sesquipedalophobia" means "fear of big words."  ;-)
  iab Ysesqui   sesquipedalophobia
"
"     Yi18n: .123456789012345678. - yup, 18 characters betwwen 'i' and 'n'
  iab Yi18n  internationalization
"
"     Yanfs: Changing the Subject within a message.  (Hi, Monty Python!)
  iab Yanfs  And now for something completely different...
"
"
"
" classic pangrams (which include every letter of the alphabet):
" German:
"   kaufen sie jede woche vier gute bequeme pelze [missing: 'xy' :-/]
"   sylvia wagt quick den jux bei pforzheim
"   bayerische jagdwitze von maxl querkopf
"   zwei boxkaempfer jagen eva quer durch sylt
"   falsches �ben von xylophonmusik qu�lt jeden gr��eren zwerg.
"   Bei jedem klugen Wort von Sokrates rief Xanthippe zynisch: Quatsch!
" English:
"       the quick brown fox jumps over the lazy dog
"       The five boxing wizards jump quickly
" French:
"        voyez le brick geant que j'examine pres du wharf.
" Polish:
"       Pchn�� w t� ��d� je�a lub o�m skrzy� fig.
"       Ko� i ��w grali w ko�ci z pi�kn� �m� u �r�d�a.
"       T�gi ko� i ma�y ��w �piewali z pi�kn� �m� u �r�d�a �ycia.
"
" And a sentence to break some quoing levels:
"       "This man's house (which 's yellow) burned down."
"
" And now for something completely different:
"       I couldn't bear to bear bears over the border.
"
" Inserting an ellipsis to indicate deleted text
  iab  Yell  [...]
  vmap ,ell c[...]<ESC>
"
" Correcting those typos. [I almost never get these right.  :-(]
" See also:  http://www.igd.fhg.de/~zach/programs/acl/
  iab alos      also
  iab aslo      also
  iab becuase   because
  iab bianry    binary
  iab bianries  binaries
  iab charcter  character
  iab charcters characters
  iab exmaple   example
  iab exmaples  examples
  iab shoudl    should
  iab seperate  separate
  iab teh       the
  iab tpyo      typo
" Some frequent typos in German:
  iab bracuht   braucht
  iab doer      oder
  iab nciht     nicht
  iab Dreckfuhler Druckfehler
"
" Sorry, Laurent!
  iab Laurant   Laurent
"
" See http://www.math.fu-berlin.de/~guckes/sig/:
  iab YDDS dash-dash-space
"
" For reports and texts on my studies:
" iab YKT Komplexitaetstheorie
" iab YRA Rechnerarchitektur
" iab YPM Pattern Matching
" see http://elib.zib.de/ICM98 :
" iab YICM International Congress of Mathematicians
"
" Some sentences that I really use often in emails about Vim:
  iab YAW You are welcome!
  iab YEV Enjoy Vim!  :-)
"
" Often used filenames - only needed these on the command line:
" see also:  http://www.math.fu-berlin.de/~guckes/setup/
"
" cab ELMALIAS  ~/.elm/aliases.text
" cab Erc       ~/.elm/elmrc
" cab Mrc       ~/.muttrc
" cab Src       ~/.slrnrc
" cab Zrc       ~/.zsh/.zshrc
"
"  Email Adresses:
"  I usually use these when adding addresses to the header
"  of emails (mutt) and posts (slrn).
"
"    Author of the Good NetKeeping Seal of Approval:
  ab Agnksa   js@xs4all.nl (Jeroen Scheerder)
"
"    Original author of Mutt:
" ab Amutt    me@cs.hmc.edu (Michael Elkins)
"    Maintainer of Mutt:
  ab Amutt    roessler@guug.de (Thomas Roessler)
"
"    Author of Slrn:
  ab Aslrn    davis@space.mit.edu (John E. Davis)
"    Maintainer of Slrn:
  ab Mslrn    tststs@gmx.de (Thomas Schultz)
"
"    Author of Vim - vim specific address:
  ab Avim     bram@vim.org (Bram Moolenaar)
"    Author of Vim - private address:
  ab Abram    Bram@Moolenaar.net (Bram Moolenaar)
"
"  Author, contributor, maintainer of
"  add atac autoconf bcpp ded dialog diffstat flist
"  lynx ncurses tin vile vttest xterm - and more!
  ab Avile dickey@his.com (Thomas E. Dickey)
"
"    Former Maintainer of the Vim FAQ:
" ab Avimfaq  laurent@Grafnetix.COM (Laurent Duperval)
  ab Avimfaq  guckes@vim.org (Sven Guckes)
"
"    Mailing Lists (MLs)
"
"    The Vim mailing lists: See http://www.vim.org/mail.html for more info!
" ab MLvim      vim@vim.org (VIM Help List)
" ab MLvimdev   vim-dev@vim.org (VIM General Development List)
" ab MLvimmac   vim-mac@vim.org (VIM on MacOS Development List)
" ab MLvimmb    vim-multibyte@vim.org (VIM MultiByte Development List)
" ab MLvimfr    vim-fr@egroups.com    (VIM Help List for French Users)
"
" More mailing lists:
" ab MLmuttdev  mutt-dev@mutt.org (Mutt Developer List)
" ab MLmuttuser mutt-users@mutt.org (Mutt Users List)
" ab MLzsh      zsh-users@sunsite.auc.dk (ZShell Users List)
"
"
"   News: newsgroup names
"
" Newsgroup about "warloding" of signatures - see
" also http://www.math.fu-berlin.de/~guckes/afw/
  iab Nafw    alt.fan.warlord
  iab Nahbou  alt.humor.best-of-usenet
  iab Nzedat  bln.announce.fub.zedat.d
  iab Ncsd    bln.announce.fub.cs.d
  iab Nce     comp.editors
  iab NcE     de.comp.editoren
" Newsgroup about "lynx":
  iab Nhtml   comp.infosystems.www.authoring.html
" Newsgroup about "elm":  Elm is dead - long live Mutt!
  iab Nelm    comp.mail.elm
" Newsgroup about "pine":  When will they release pine-4?
" iab Ncmp    comp.mail.pine
  iab Npine   comp.mail.pine
" iab Ncsmd   comp.sys.mac.digest
" Newsgroup about "mobil phone systems":
  iab Ndcm    de.comm.mobil
  iab Nmobil  de.comm.mobil
" Newsgroup about "web browsers":
  iab Nlynx     comp.infosystems.www.browsers.misc
  iab Nnetscape comp.infosystems.www.browsers.misc
" Newsgroup about "mutt" [since 980401]:  The coolest mail user agent
  iab Nmutt   comp.mail.mutt
" Newsgroup about "nn":  Once was the best newsreader. Still good.
  iab Nnn     news.software.nn
" Newsgroup for "newbies".
" All you ever wanted to know - but were afraid to ask. ;-)
  iab Newbie  news.newusers.questions
" Newsgroup about "newsreader *agents*" (netscape and slrn):
  iab Nnsr    news.software.readers
"
" Usenet header lines (used when composing a post):
"
  iab UFT  Followup-To:
  iab UMCT Mail-Copies-To: MYADDR
  iab UNG  Newsgroups:
  iab URT  Reply-To: MYADDR
  iab UFUB Organization: Freie Universitaet Berlin
"
" Current version numbers of my favourite programs:
" http://www.math.fu-berlin.de/~guckes/faq/program.versions.html
" And some abbreviations to type them in mail&news:
" [Last update: 001221]
  iab Velmold  ELM2.4PL25 [951204]
  iab Velm     ELM2.5.3 [000113]
  iab Velmme   ELMME+86 [001219]
  iab Vless    less-358 [000709]
  iab Vlynx    lynx-2.8.4dev14 [001103]
  iab Vmutt    mutt-1.2.5 [000729]
  iab Vslrn    slrn-0.9.6.3 [000918]
  iab Vvim     vim-5.7 [000624]
  iab Vvimdev  vim-6.0w [010226]
"
" My phone number (main phone number and fax):
  iab Yphone TEL (+49 30) 8838884<CR>FAX (+49 30) 88629362
" My cellphone number:
  iab Ycell  TEL (+49 179) 3966141
" If you like then send me a short message to my cellphone via this page:
  iab FreeSMS http://www.free-sms.com/sendsms/index.php3
" My snailmail address.  Postcards, anyone?
  iab Ysnail Sven Guckes<C-M>Pariser Str. 52<C-M>D-10719 Berlin
" My ICQ number.  Chat, anyone?
  iab YICQ   ICQ:38801898
"
"  My addresses (Email and WWW)
"  makes it easy to type them without typos  ;-)
  ab Amaili     guckes@inf.fu-berlin.de
  ab Amailm     guckes@math.fu-berlin.de
  ab Amailv     guckes@vim.org
  ab Amailz     guckes@zedat.fu-berlin.de
" ab Apriv        sven@guckes.net
  ab MYADDR     guckes@math.fu-berlin.de
  ab MYNAME     Sven Guckes
  ab MYDOMAIN   math.fu-berlin.de
" ab MYDOMAIN   guckes.net
"
" Setting the reply address when replying as the guy from SKB:
" ab ASKB   Sprachboerse <sprachboerse@tu-berlin.de>
" See also: http://www.math.fu-berlin.de/~guckes/skb/
"
"  My Home Pages at the departments at the FUB and elsewhere...
"
  ab WWWb   http://www.belug.org/~guckes/
  ab WWWm   http://www.math.fu-berlin.de/~guckes/
  ab WWWi   http://www.inf.fu-berlin.de/~guckes/
  ab WWWz   http://userpage.zedat.fu-berlin.de/~guckes/
"
" WWW Pages base URLs
"
  ab HPA   http://www.math.fu-berlin.de/~guckes/afw/
  ab HPa   http://www.math.fu-berlin.de/~guckes/ascii/
  ab HPc   http://www.math.fu-berlin.de/~guckes/calvin/
  ab HPD   http://www.math.fu-berlin.de/~guckes/dos/
  ab HPe   http://www.math.fu-berlin.de/~guckes/eplus/ab.faq.html
  ab HPE   http://www.math.fu-berlin.de/~guckes/elm/
  ab HPI   http://www.math.fu-berlin.de/~guckes/irc/
  ab HPi   http://www.math.fu-berlin.de/~guckes/ispell/
  ab HPL   http://www.math.fu-berlin.de/~guckes/lynx/
  ab HPl   http://www.math.fu-berlin.de/~guckes/less/
  ab HPm   http://www.math.fu-berlin.de/~guckes/mail/
  ab HPme  http://www.math.fu-berlin.de/~guckes/mail/edit.html
  ab HPM   http://www.math.fu-berlin.de/~guckes/mutt/
  ab HPN   http://www.math.fu-berlin.de/~guckes/nn/
  ab HPP   http://www.math.fu-berlin.de/~guckes/pine/
  ab HPp   http://www.math.fu-berlin.de/~guckes/procmail/
  ab HPR   http://www.math.fu-berlin.de/~guckes/rot13/
  ab HPr   http://www.math.fu-berlin.de/~guckes/rtfm/
  ab HPs   http://www.math.fu-berlin.de/~guckes/screen/
  ab HPS   http://slrn.sourceforge.net/
  ab HPS1  http://www.math.fu-berlin.de/~guckes/slrn/
  ab HPS2  http://www.slrn.org/
"    HPov - the "original" URL of the Vi Editor Page!
  ab HPov  http://www.math.fu-berlin.de/~guckes/vi/
  ab HPv   http://vi-editor.org
  ab HPw   http://www.math.fu-berlin.de/~guckes/windows/
  ab HPV   http://www.vim.org/
"    HPOV - the "original" URL of the Vim Home Page!
  ab HPOV  http://www.math.fu-berlin.de/~guckes/vim/
  ab HPx   http://www.math.fu-berlin.de/~guckes/xmas/
  ab HPz   http://www.math.fu-berlin.de/~guckes/zsh/
"
" Other important WWW addresses
"
  ab URLaltavista http://www.altavista.de/textonly.html
  ab URLftpsearch http://ftpsearch.lycos.com/?form=advanced
  ab URLrpmfind   http://rpmfind.net
  ab URLslashdot  http://slashdot.org
  ab URLfreshmeat http://freshmeat.net
" 
" Pictures:
  ab URLbambi     http://www.math.fu-berlin.de/~guckes/pics/calvin/bambi.gif
  ab URLsecret    http://www.math.fu-berlin.de/~guckes/pics/calvin/secret.gif
  ab URLwhome     http://www.math.fu-berlin.de/~guckes/pics/calvin/who_me.gif
  ab URLstopspam  http://www.math.fu-berlin.de/~guckes/pics/spam/stop.jpg
  ab URLutefuchs  http://www.math.fu-berlin.de/~utefuchs/
"
" The nearest vim site for me:
  ab FTPG         ftp://ftp.math.fu-berlin.de/pub/usr/guckes/
  ab FTPFUB       ftp://ftp.fu-berlin.de/
  ab FTPVIM       ftp://ftp.fu-berlin.de/pub/misc/editors/vim/
  ab URLVINE      http://www.mossbayeng.com/~ron/vim/vine.html
" But you should look at http://www.vim.org/dist.html instead!
"
" ===================================================================
" Abbreviations - Header Lines for Email and News
" ===================================================================
" Define regexpr for headers to use with mappings
" as it makes reading the mappings much easier:
" cab HADDR     From\\|Cc\\|To
  cab HEMAIL ^\(From\\|Cc\\|To\\|Date\\|Subject\\|Message-ID\\|Message-Id\\|X-\)
  cab HNEWS  ^\(From\\|Cc\\|To\\|Date\\|Subject\\|Message-ID\\|X-\\|Newsgroups\)
"
" ===================================================================
" Abbreviations - General Editing - Inserting Dates and Times
" ===================================================================
"
" First, some command to add date stamps (with and without time).
" I use these manually after a substantial change to a webpage.
" [These abbreviations are used with the mapping for ",L".]
"
  iab Ydate <C-R>=strftime("%y%m%d")<CR>
" Example: 971027
"
  iab Ytime <C-R>=strftime("%H:%M")<CR>
" Example: 14:28
"
" man strftime:     %T      time as %H:%M:%S
" iab YDT           <C-R>=strftime("%y%m%d %T")<CR>
" Example: 971027 12:00:00
"
" man strftime:     %X      locale's appropriate time representation
  iab YDT           <C-R>=strftime("%y%m%d %X")<CR>
" Example: 000320 20:20:20
"
  iab YDATE <C-R>=strftime("%a %b %d %T %Z %Y")<CR>
" Example: Tue Dec 16 12:07:00 CET 1997
"
" On Windows the functions "strftime" seems to have a different
" format.  Therefore the following may be necessary:  [980730]
" if !has("unix")
" iab YDATE <C-R>=strftime("%c %a")<CR>
" else
" iab YDATE <C-R>=strftime("%D %T %a")<CR>
" endif
"
" 000306: These two lines at the start of a Perl script
" will start the first Perl in your Shell's $PATH.
  iab Yperlhead eval 'exec perl -w -S $0 ${1+"$@"}'<c-m>if 0;<c-m>
"
"
" ===================================================================
" MAPpings
" ===================================================================
" Caveat:  Mapping must be "prefix free", ie no mapping must be the
" prefix of any other mapping.  Example:  "map ,abc foo" and
" "map ,abcd bar" will give you the error message "Ambigous mapping".
"
" The backslash ('\') is the only(?) unmapped key, so this is the best
" key to start mappings with as this does not take away a command key.
" However, the backslash is never in the same position with keyboards.
" Eg on German keyboards it is AltGr-sz - don't ask.
" Anyway, I have decided to start mappings with the comma as this
" character is always on the same position on almost all keyboards
" and I hardly have a need for that command.
"
" The following maps get rid of some basic problems:
"
" When the backspace key sends a "delete" character
" then you simply map the "delete" to a "backspace" (CTRL-H):
" map <Del> <C-H>
"
" With Vim-4 the format command was just 'Q' and
" I am too used to it.  So I need this back!
  nnoremap Q gq
  vnoremap Q gq
"
" 980527 I often reformat a paragraph to fit some textwidth -
" and I use the following mapping to adjust it to the
" current position of the cursor:
  map #tw :set textwidth=<C-R>=col(".")<C-M>
"
" 981210 Whenever I paste some text into VIM I have to
" toggle from "nopaste" to "paste" and back again:
" map <f4>   :set paste!<C-M>:set paste?<C-M>
" map <esc>[14~ :set paste!<C-M>:set paste?<C-M>
" --> new option for this:  'pastetoggle'
"
" "tal" is the "trailer alignment" filter program
" Hopefully it will ship with Vim one day.
" vmap #t !tal<CR>
" vmap #t !tal -p 0<CR>
"
" Disable the command 'K' (keyword lookup) by mapping it
" to an "empty command".  (thanks, Lawrence! :-):
" map K :<CR>
" map K :<BS>
" More elegant:  (Hi Aziz! :-)
  map K <NUL>
"
" Disable the suspend for ^Z.
" I use Vim under "screen" where a suspend would lose the
" connection to the " terminal - which is what I want to avoid.
  map <C-Z> :shell
"
" Make CTRL-^ rebound to the *column* in the previous file
  noremap <C-^> <C-^>`"
"
" Make "gf" rebound to last cursor position (line *and* column)
  noremap gf gf`"
"
" When I let Vim write the current buffer I frequently mistype the
" command ":w" as ":W" - so I have to remap it to correct this typo:
  nmap :W :w
" TODO:  Use the following (after some testing):
" command -nargs=? -bang W w<bang> <args>
"
" Are you used to the Unix commands "alias" and "which"?
" I sometimes use these to look up my abbreviations and mappings.
" So I need them available on the command line:
  map :alias map
  map :which map
"
" The command {number}CTRL-G show the current nuffer number, too.
" This is yet another feature that vi does not have.
" As I always want to see the buffer number I map it to CTRL-G.
" Pleae note that here we need to prevent a loop in the mapping by
" using the comamnd "noremap"!
  noremap <C-G> 2<C-G>
"
" 001010  Do the Color Test!
  map ,CT :sp $VIMRUNTIME/syntax/colortest.vim<cr>:so %<cr>
" 000329  View the file which defines the "filetypes":
  map ,F :view $VIMRUNTIME/filetype.vim
"
" 980311  Sourcing syntax files::
  map ,SO :source $VIMRUNTIME/syntax/
"
" 980706,000310 View a syntax file:
  map ,V  :view $VIMRUNTIME/syntax/
"
" 000801     Hilite Test - show all current highlight groups
" see ":help hitest.vim"
  map ,HI :so $VIMRUNTIME/syntax/hitest.vim
"
" 990614  Quick insertion of an empty line:
" nmap <CR> o<ESC>
" I find this convenient - but as I am also used to proceed to
" next line by pressing CR this often gives me new empty lines
" when I really do not need them.  :-(
"
" ===================================================================
" Customizing the command line
" ===================================================================
" Valid names for keys are:  <Up> <Down> <Left> <Right> <Home> <End>
" <S-Left> <S-Right> <S-Up> <PageUp> <S-Down> <PageDown>  <LeftMouse>
"
" Many shells allow editing in "Emacs Style".
" Although I love Vi, I am quite used to this kind of editing now.
" So here it is - command line editing commands in emacs style:
  cnoremap <C-A>      <Home>
  cnoremap <C-B>      <Left>
" cnoremap <C-B>      <Del>
  cnoremap <C-E>      <End>
  cnoremap <C-F>      <Right>
  cnoremap <C-N>      <End>
  cnoremap <C-P>      <Up>
  cnoremap <ESC>b     <S-Left>
  cnoremap <ESC><C-B> <S-Left>
  cnoremap <ESC>f     <S-Right>
  cnoremap <ESC><C-F> <S-Right>
  cnoremap <ESC><C-H> <C-W>
" Note:  More info about this is in the helptexts:  :help emacs-keys
"
" Additional codes for that "English" keyboard at the Xterminal
  cnoremap <ESC>[D <Left>
  cnoremap <ESC>[C <Right>
"
" ===================================================================
" VIM - Editing and updating the vimrc:
" As I often make changes to this file I use these commands
" to start editing it and also update it:
  if has("unix")
    let vimrc='~/.vimrc'
  else
" ie:  if has("dos16") || has("dos32") || has("win32")
    let vimrc='$VIM\_vimrc'
  endif
  nn  ,u :source <C-R>=vimrc<CR><CR>
  nn  ,v :edit   <C-R>=vimrc<CR><CR>
"     ,v = vimrc editing (edit this file)
" map ,v :e ~/.vimrc<CR>
"     ,u = "update" by reading this file
" map ,u :source ~/.vimrc<CR>
" ===================================================================
"
" General Editing
"
" Define "del" char to be the same backspace (saves a LOT of trouble!)
" As the angle notation cannot be use with the LeftHandSide
" with mappings you must type this in *literally*!
" map <C-V>127 <C-H>
"cmap <C-V>127 <C-H>
" the same for Linux Debian which uses
 imap <Esc>[3~ <C-H>
"
"      ;rcm = remove "control-m"s - for those mails sent from DOS:
  cmap ;rcm %s/<C-M>//g
"
"     Make whitespace visible:
"     Sws = show whitespace
  nmap ,Sws :%s/ /_/g<C-M>
  vmap ,Sws :%s/ /_/g<C-M>
"
"     Sometimes you just want to *see* that trailing whitespace:
"     Stws = show trailing whitespace
  nmap ,Stws :%s/  *$/_/g<C-M>
  vmap ,Stws :%s/  *$/_/g<C-M>
"
" General Editing - Turning umlauts into ascii (for German keyboards)
"
" imap � ae
" imap � oe
" imap � ue
" imap � ss
"
" &#196; -> �  :%s/\&#196;/�/gc  -> D
" &#214; -> �  :%s/\&#214;/�/gc  -> V
" &#220; -> �  :%s/\&#220;/�/gc  -> \
" &#228; -> �  :%s/\&#228;/�/gc  -> d
" &#246; -> �  :%s/\&#246;/�/gc  -> v
" &#252; -> �  :%s/\&#252;/�/gc  -> |
"
" ===================================================================
" Inserting Dates and Times / Updating Date+Time Stamps
" ===================================================================
"     ,L  = "Last update" - replace old time stamp with a new one
"        preserving whitespace and using internal "strftime" command:
"       requires the abbreviation  "YDATE"
  map ,L  1G/Last update:\s*/e+1<CR>CYDATE<ESC>
  map ,,L 1G/Last change:\s*/e+1<CR>CYDATE<ESC>
" Example:
" before:  "Last update:   Thu Apr  6 12:07:00 CET 1967"
" after:   "Last update:   Tue Dec 16 12:07:00 CET 1997"
"
"  I used to read in the output from the external command "date"
"  but this is a little slow and does not work on all systems:
" map ,L 1G/Last update: */e+1<CR>D:r!date<CR>kJ
"
" ===================================================================
" General Editing - link to program "screen"
" ===================================================================
"
"       ,Et = edit temporary file of "screen" program
  map   ,Et :e /tmp/screen-exchange
"       as a user of Unix systems you *must* have this program!
"       see also:  http://www.math.fu-berlin.de/~guckes/screen/
"
" Email/News - Editing replies/followups
"
" Part 1 - prepare for editing
"
" Part 2 - getting rid of empty (quoted) lines and space runs.
"
" Delete trailing whitespace:
 nmap <f9> :%s/\s\+$//
 vmap <f9>  :s/\s\+$//
"
"      ,cel = "clear empty lines"
"       - delete the *contents* of all lines which contain only whitespace.
"         note:  this does not delete lines!
" map ,cel :g/^[<C-I> ]*$/d
  map ,cel :%s/^\s\+$//
"
"      ,del = "delete 'empty' lines"
"       - delete all lines which contain only whitespace
"         note:  this does *not* delete empty lines!
  map ,del :g/^\s\+$/d
"
"      ,cqel = "clear quoted empty lines"
"       Clears (makes empty) all lines which start with '>'
"       and any amount of following spaces.
" nmap ,cqel :%s/^[> ]*$//
" vmap ,cqel  :s/^[> ]*$//
" nmap ,cqel :%s/^[><C-I> ]\+$//
" vmap ,cqel  :s/^[><C-I> ]\+$//
  nmap ,cqel :%s/^[>]\+$//
  vmap ,cqel  :s/^[><C-I> ]\+$//
" NOTE: If the meta sequence "\s"
" The following does not work because "\s" is not a character
" and thus cannot be part of a "character set".
"  map ,cqel  :%s/^[>\s]\+$//
"
" Some people have strange habits within their writing.
" But if you cannot educate them - rewrite their text!  ;-)
"
" Jason "triple-dots" King elephant@onaustralia.com.au
" does uses ".." or "..." rather than the usual punctuation
" (comma, semicolon, colon, full stop). So...
"
" Turning dot runs with following spaces into an end-of-sentence,
" ie dot-space-space:
  vmap ,dot :s/\.\+ \+/.  /g
"
" Gary Kline (kline@tera.tera.com) indents his
" own text in replies with TAB or spaces.
" Here's how to get rid of these indentation:
  vmap ,gary :s/^>[ <C-I>]\+\([^>]\)/> \1/
"
"      ,ksr = "kill space runs"
"             substitutes runs of two or more space to a single space:
" nmap ,ksr :%s/  */ /g
" vmap ,ksr  :s/  */ /g
  nmap ,ksr :%s/  \+/ /g
  vmap ,ksr  :s/  \+/ /g
" Why can't the removal of space runs be
" an option of "text formatting"? *hrmpf*
"
"    ,Sel = "squeeze empty lines"
"    Convert blocks of empty lines (not even whitespace included)
"    into *one* empty line (within current visual):
   map ,Sel :g/^$/,/./-j
"
"    ,Sbl = "squeeze blank lines"
"    Convert all blocks of blank lines (containing whitespace only)
"    into *one* empty line (within current visual):
"  map ,Sbl :g/^\s*$/,/[^ <C-I>]/-j
"  map ,Sbl :g/^\s*$/,/[^ \t]/-j
   map ,Sbl :g/^\s*$/,/\S/-j
"
" ===================================================================
" AUTOCOMMANDS:
" Editing of email replies and Usenet followups - using autocommands
" ===================================================================
"
" First step:  Remove ALL auto-commands.  This avoids having the
" autocommands twice when the vimrc file is sourced again.
  autocmd!
"
" Add/change some filename patterns to filetypes:
" let myfiletypefile = "~/.vim.myfiletypes"
"
" And this goes into  "~/.vim.myfiletypes":
" augroup filetype
" au BufRead,BufNewFile postpone/*  set filetype=mail
" augroup END
"
" Apply my syntax file on files with extension "sdg":
  au BufNewFile,BufRead *.sdg                     set ft=sveng
"
" Apply the muttrc coloring to my mutt setup files:
  au BufNewFile,BufRead .mutt.*                   set ft=muttrc
"
" SLRN: Apply mail.vim to postponed messages:
  au BufNewFile,BufRead */postpone/*              set ft=mail
"
" Set some options for "messages" (FileType "mail"):
" au FileType mail set autoindent expandtab tabstop=4 textwidth=70
" the following uses ethe short option names:
  if version>=600
  au FileType mail set ai et ts=4 tw=70
  endif
"
" Some more autocommand examples which set the values for
" "autoindent", "expandtab", "shiftwidth", "tabstop", and "textwidth":
" using the "FileType" event:
" au FileType c           set ai et sw=4 ts=4
" au FileType perl        set ai et sw=4 ts=4
" au FileType html        set ai    sw=2 ts=2
" au FileType java        set ai    sw=4 ts=4
" au BufEnter */drafts/*  set tw=72
"
" Try to use the mapping ",D" when doing a followup.
" autocmd BufNewFile ~/.followup ,D|
"
" Setting "X-Editor":
" Let Vim identify itself in the message header
" when editing emails with Mutt and Slrn:
" au FileType mail let @"="X-Editor: Vim-".version." http://www.vim.org/\n"|exe 'norm 1G}""P'
"
" Generation of a "Message-ID" header line (according to ISO8061):
"
" Let Vim add a Message-ID to your posts with Slrn:
"
" Add a Message-ID to posts with Slrn:
" au BufNewFile,BufRead ~/.article let @"="Message-ID: <slrn.".system("uname").".".strftime("%y%m%d%H%M")."\n"|exe 'norm 1G}""P'
" Problem:  The uname adds a CTRL-J at the end of the output.  :-(
"
" Add a Message-ID to posts with Slrn (mimimal format):
" au BufNewFile,BufRead ~/.article,~/.followup let @"="Message-ID: <".strftime("%Y%m%dT%H%M%S")."@guckes.net>\n"|exe 'norm 1G}""P'
" Example:  Message-ID: <20000406T120700@guckes.net>
" Problem:  The date and time are hard to read.
" It's easier with a few delimiters:
"
" Add a Message-ID to posts with Slrn (with delimiters):
" au BufNewFile,BufRead ~/.article,~/.followup let @"="Message-ID: <".strftime("%Y-%m-%dT%H-%M-%S")."@guckes.net>\n"|exe 'norm 1G}""P'
" Example:  Message-ID: <2000-04-06T12-07-00@guckes.net>
"
" news.fu-berlin.de rejects Message-IDs with colons in it:
" Example:  Message-ID: <2000-04-06T12:07:00@guckes.net>
"
"
" Part 3 - Change Quoting Level
"
"      ,dp = de-quote current inner paragraph
"  map ,dp {jma}kmb:'a,'bs/^> //<CR>
   map ,dp vip:s/^> //<CR>
  vmap ,dp    :s/^> //<CR>
"
"      ,qp = quote current paragraph
"            jump to first inner line, mark with 'a';
"            jump to last  inner line, mark with 'b';
"            then do the quoting as a substitution
"            on the line range "'a,'b":
"  map ,qp {jma}kmb:'a,'bs/^/> /<CR>
"      vim-5 now has selection of "inner" and "all"
"      of current text object - mapping commented!
"
"      ,qp = quote current paragraph (old version)
"            jump to first inner line, Visual,
"            jump to last  inner line,
"            then do the quoting as a substitution:
"  map ,qp {jV}k:s/^/> /<CR>
"
"      ,qp = quote current inner paragraph (works since vim-5.0q)
"            select inner paragraph
"            then do the quoting as a substitution:
   map ,qp   vip:s/^/> /<CR>
"
"      ,qp = quote current paragraph
"            just do the quoting as a substitution:
  vmap ,qp    :s/^/> /<CR>
"
"       ## = comment current inner paragraph with '#':
  nmap  ##   vip:s/^/#<space>/<CR>
"       ## = comment current text selection  with '#':
  vmap  ##      :s/^/#<space>/<CR>
"
" 001006:  Commenting selected lines in C style:
" vmap ## :s#^#// #<cr>'<O/*<esc>'>o*/<esc>gv
"
" Example of result:
" /*
" // foo
" // bar
" /*
"
" Changing quote style to *the* true quote prefix string "> ":
"
"       Fix Supercite aka PowerQuote (Hi, Andi! :-):
"       before ,kpq:    >   Sven> text
"       after  ,kpq:    > > text
"      ,kpq kill power quote
  vmap ,kpq :s/^> *[a-zA-Z]*>/> >/<C-M>
"
"       Fix various other quote characters:
"      ,fq "fix quoting"
  vmap ,fq :s/^> \([-":}\|][ <C-I>]\)/> > /
"
"  Fix the quoting of "Microsoft Internet E-Mail":
"  The guilty mailer identifies like this:
"  X-Mailer: Microsoft Internet E-Mail/MAPI - 8.0.0.4211
"  
"  And this is how it quotes - with a pseudo header:
"
"  -----Ursprungliche Nachricht-----
"  Von:            NAME [SMTP:ADDRESS]
"  Gesendet am:    Donnerstag,  6. April 2000 12:07
"  An:             NAME
"  Cc:             NAME
"  Betreff:        foobar
"
" And here's how I "fix" this quoting:
" (it makes use of the mappings ",dp" and ",qp"):
  map #fix1 /^> -----.*-----$<cr>O<esc>j,dp<c-o>dapVG,qp
"
" 010613
" X-Mailer: Internet Mail Service (5.5.2650.21)
" Oh, boy, I *hate* this mailer.  This
" one certainly sends *crappy* mails.
" Eg it adds "[NAME]__" to each new text.
" This should remove it from the mail body:
  map #fix2 :/^$/,$s/\t\[.*\]\s\+//
"
" Part 4 - Weed Headers of quoted mail/post
"
" These mappings make use of the abbreviation that define a list of
" Email headers (HEMAIL) and News headers (HNEWS):
  nmap ,we vip:v#HEMAIL#d
  vmap ,we    :v#HEMAIL#d
  nmap ,wp vip:v#HNEWS#d
  vmap ,wp    :v#HNEWS#d
"
"      ,ri = "Read in" basic lines from the email header
"            Useful when replying to an email:
" nmap ,ri :r!readmsg\|egrep "^From:\|^Subject:\|^Date:\|^To: \|^Cc:"
"            NOTE: "readmsg" ships with the mailer ELM.
"
"
" Part 5 - Reformatting Text
"
"  NOTE:  The following mapping require formatoptions to include 'r'
"    and "comments" to include "n:>" (ie "nested" comments with '>').
"
" Formatting the current paragraph according to
" the current 'textwidth' with ^J (control-j):
" imap <C-J> <C-O>gqap  " too dangerous for my editing ;-)
  nmap <C-J>      gqap
  vmap <C-J>      gq
"
" Here is a variation of this command.  It inserts the character
" CTRL-Z at the current position to enable to rebound to the
" previous position within the text.  [Hello, Y. K. Puckett!]
"  map <C-J> i<C-Z><esc>gqip?<C-Z><cr>x
" imap <C-J>  <C-Z><esc>gqip?<C-Z><cr>xi
"
" Some people prefer to use extrernal formatting utilities
" such as "fmt" or "par":
" nmap <C-J>   !}fmt<cr>
" vmap <C-J>    !fmt<cr>
"
"
"      ,b = break line in commented text (to be used on a space)
" nmap ,b dwi<CR>> <ESC>
  nmap ,b r<CR>
"      ,j = join line in commented text
"           (can be used anywhere on the line)
" nmap ,j Jxx
  nmap ,j Vjgq
"
"      ,B = break line at current position *and* join the next line
" nmap ,B i<CR>><ESC>Jxx
  nmap ,B r<CR>Vjgq
"
"      ,,, break current line at current column,
"          inserting ellipsis and "filling space":
" nmap ,,,  ,,1,,2
" nmap ,,1  a...X...<ESC>FXr<CR>lmaky$o<CC-R>"<ESC>
" nmap ,,2  :s/./ /g<C-M>3X0"yy$dd`a"yP
"
"
" ===================================================================
" Edit your reply!  (Or else!)
" ===================================================================
"
" Part 6  - Inserting Special or Standard Text
" Part 6a - The header

"    Add adresses for To: and Cc: lines
"
"     ,ca = check alias (reads in expansion of alias name)
" map ,ca :r!elmalias -f "\%v (\%n)"
"     ,Ca = check alias (reads in expansion of alias name)
" map ,Ca :r!elmalias -f "\%n <\%v>"
"
"   ,cc = "copy notice"
"   Insert a Cc line so that person will receive a "courtesy copy";
"   this tells the addressee that text is a copy of a public article.
"   This assumes that there is exactly one empty line after the first
"   paragraph and the first line of the second paragraph contains the
"   return address with a trailing colon (which is later removed).
  map ,cc 1G}jyykPICc: <ESC>$x
" map ,cc ma1G}jy/ writes<CR>'aoCc: <ESC>$p
"
"     ,mlu = make letter urgent  (by giving the "Priority: urgent")
  map ,mlu 1G}OPriority: urgent<ESC>
"
"               Fixing the From: line
"
"     ,cS = change Sven's address.
  map ,cS 1G/^From: /e+1<CR>CSven Guckes <guckes@vim.org><ESC>
"     Used when replying as the "guy from vim".
"
"               Adjusting my Reply-To line [001010]
"
"       Reply-To: guckes-usenet@math.fu-berlin.de
"
"     ,cr = change Reply-TO line
  map ,cr 1G/^Reply-To: guckes-usenet/e-5<CR>ct@
"
"               Fixing the Subject line
"
"    Pet peeve:  Unmeaningful Subject lines.  Change them!
"     ,cs = change Subject: line
  map ,cs 1G/^Subject: <CR>yypIX-Old-<ESC>-W
"    This command keeps the old Subject line in "X-Old-Subject:" -
"    so the recipient can still search for it and
"    you keep a copy for editing.
"
" 001115:
"     ,CS = Change Subject: line
  map ,CS 1G/^Subject: <CR>:s/Re:/was:/<CR>Wi(<C-O>$)<ESC>0Wi
" This changes the "Re:" to "was:", puts everything into parentheses
" and then sets the cursor before the opening bracket for insertion
" of a new Subject line (which hopefully matches the contents better).
" Subject: Re: something
" Subject: X(was: something)
"
"
"     ,re : Condense multiple "Re:_" to just one "Re:":
  map ,re 1G/^Sub<CR>:s/\(Re: \)\+/Re: /<CR>
"
"     ,Re : Change "Re: Re[n]" to "Re[n+1]" in Subject lines:
  map ,Re 1G/^Subject: <C-M>:s/Re: Re\[\([0-9]\+\)\]/Re[\1]/<C-M><C-A>
"
" Put parentheses around "visual text"
"      Used when commenting out an old subject.
"      Example:
"      Subject: help
"      Subject: vim - using autoindent (Re: help)
"
"      ,) and ,( :
  vmap ,( v`<i(<ESC>`>a)<ESC>
  vmap ,) v`<i(<ESC>`>a)<ESC>
"
" Part 6  - Inserting Special or Standard Text
" Part 6a - Start of text - saying "hello".
"
"     ,hi = "Hi!"        (indicates first reply)
  map ,hi 1G}oHi!<CR><ESC>
"
"     ,ha = "helloagain"  (indicates reply to reply)
  map ,ha 1G}oHello, again!<CR><ESC>
"
"     ;HA = "Hallo, <NAME>!"  (German equivalent of "hi!" for replies)
" map ;HA G/Quoting /e+1<CR>ye1G}oHallo, !<ESC>Po<ESC>
" map ;HA G/^\* /e+1<CR>ye1G}oHallo, !<ESC>Po<ESC>
  map ;;  G/^\* /e+1<CR>ye1G}oHallo, <c-r>"!<cr><ESC>
"
"     ,He = "Hello, <NAME>!"
" map ,He G/Quoting /e+1<CR>ye1G}oHallo, !<ESC>Po<ESC>
  map ,He G/^\* /e+1<CR>ye1G}oHello, !<ESC>Po<ESC>
"
" Part 6  - Inserting Special or Standard Text
" Part 6b - End of text - dealing with "signatures".
"
"       remove signatures
"
"     ,kqs = kill quoted sig (to remove those damn sigs for replies)
"          goto end-of-buffer, search-backwards for a quoted sigdashes
"          line, ie "^> -- $", and delete unto end-of-paragraph:
  map ,kqs G?^> -- $<CR>d}
" map ,kqs G?^> *-- $<CR>dG
"     ,kqs = kill quoted sig unto start of own signature:
" map ,kqs G?^> *-- $<CR>d/^-- $/<C-M>
"
" ===================================
" Adding quotes and signatures easily
" ===================================
"
"     QUOTES:  http://www.math.fu-berlin.de/~guckes/quotes/collection
  let QUOTES=expand("~/.P/quotes/collection")
"
"  Decide which quote file to use:
" if     filereadable("~/.P/quotes/collection")
"   let QUOTES=expand("~/.P/quotes/collection")
" else
"   use a copy in the homedir:
"   let QUOTES=expand("~/.quotes")
" endif
"
"      ,aq = "add quote"
"            Reads in a quote from my favourite quotations:
" nmap ,aq :r!agrep -d "^-- $" ~/.P/quotes/collection<ESC>b
  nmap ,aq :exe ":r!agrep -d '^-- $' ".QUOTES<S-Left>
"
" SIGNATURES:  http://www.math.fu-berlin.de/~guckes/sig/SIGS
"
  let  SIGS=expand("~/.P/sig/SIGS")
  if !filereadable(SIGS)
"   use a copy in the homedir:
    let SIGS=expand("~/.signatures")
  endif
"
"      ,s = "sign" -
"           Read in signature file (requires manual completion):
" nmap ,s :r!agrep -d "^-- $" ~/.P/sig/SIGS<S-Left>
" nmap ,s :exe ":r!agrep -d '^-- $' ".SIGS<S-Left>
" nmap ,s :exe ":r!agrep -d '^-- $' '' ".SIGS<S-Left><S-Left><right>
  nmap ,s :r!agrep -d "^-- $" '' ~/.P/sig/SIGS<S-Left><S-Left><right>
"
" SEE ALSO:
" Sven's page on sigs:   http://www.math.fu-berlin.de/~guckes/sig/
" Sven's page on agrep:  http://www.math.fu-berlin.de/~guckes/agrep/
"
"      ,at = "add text" -
"            read in text file (requires manual completion):
  nmap ,at :r ~/.P/txt/
"
" MUTT: Auto-kill signatures for replies
" map ,kqs G?^> *-- $<C-M>dG
" autocmd BufNewFile,BufRead .followup,.letter,mutt*,nn.*,snd.* :normal ,kqs
"
" At the end of editing your reply you should check your spelling
" with the spelling checker "ispell".
" These mappings are from Lawrence Clapp lclapp@iname.com:
" spellcheck the document -- skip quoted text
" nmap <F5> :w ! grep -v '^>' \| spell<CR>
" vmap <F5> :w ! grep -v '^>' \| spell<CR>
" At home under Linux it looks something more like this:
" nmap <F5> :w ! grep -v '^>' \| ispell -???<CR>
"
"  Tell the recipient that I was replying to an old email of his:
  ab SvenR Sven  [finally takeing the time to reply to old emails]
"
" Toggles:  [todo]
"
" toggle autoindent
" toggle hlsearch
" cycle textwidth between values 60, 70, 75, 80
"
" ===================================================================
" LaTeX - LaTeX - LaTeX - LaTeX - LaTeX - LaTeX - LaTeX
" ===================================================================
" This has become quite big - so I moved it out to another file:
" http://www.math.fu-berlin.de/~guckes/vim/source/latex.vim
  let FILE="/home/robinson/emailer/guckes/.P/vim/source/latex.vim"
  if filereadable(FILE)
     let RESULT="file readable"
     exe "source " . FILE
  else
     let RESULT="file not readable"
  endif
"
" ===================================================================
" PGP - encryption and decryption
" ===================================================================
"
" encrypt
  map ;e :%!/bin/sh -c 'pgp -feast 2>/dev/tty'
" decrypt
  map ;d :/^-----BEG/,/^-----END/!/bin/sh -c 'pgp -f 2>/dev/tty'
" sign
  map ;s :,$! /bin/sh -c 'pgp -fast +clear 2>/dev/tty'
  map ;v :,/^-----END/w !pgp -m
"
" PGP - original mappings
"
"       encrypt and sign (useful for mailing to someone else)
"csh: map #1 :,$! /bin/sh -c 'pgp -feast 2>/dev/tty^V|^V|sleep 4'
" sh: map #1 :,$! pgp -feast 2>/dev/tty^V|^V|sleep 4
"
"       sign (useful for mailing to someone else)
"csh: map #2 :,$! /bin/sh -c 'pgp -fast +clear 2>/dev/tty'
" sh: map #2 :,$! pgp -fast +clear 2>/dev/tty
"
"       decrypt
"csh: map #3 :/^-----BEG/,/^-----END/!\
"             /bin/sh -c 'pgp -f 2>/dev/tty^V|^V|sleep 4'
" sh: map #3 :/^-----BEG/,/^-----END/!\
"             pgp -f 2>/dev/tty^V|^V|sleep 4
"
"       view (pages output, like more)
"csh: map #4 :,/^-----END/w !pgp -m
" sh: map #4 :,/^-----END/w !pgp -m
"
"       encrypt alone (useful for encrypting for oneself)
"csh: map #5 :,$! /bin/sh -c 'pgp -feat 2>/dev/tty^V|^V|sleep 4'
" sh: map #5 :,$! pgp -feat 2>/dev/tty^V|^V|sleep 4
"
" Elijah http://www.mathlab.sunysb.edu/~elijah/pgppub.html says :
" The significant feature is that stderr is redirected independently
" of stdout, and it is redirected to /dev/tty which is a synonym for
" the current terminal on Unix.  I don't know why the ||sleep 4
" stuff is there, but it is harmless so I left it. Since csh is such
" junk, special rules are used if you are using it (tcsh, too).
" ksh and bash should use the sh form. zsh, et al: consult your
" manual.  The #<num> format is used to map function keys. If your
" terminal does not support the requested function key, use a
" literal #<num>.  Not all of the clones correctly support this.
"
" ===================================================================
" Useful stuff.  At least these are nice examples.  :-)
" ===================================================================
"
"     ,t = "transpose" - aXb -> bXa
"     This exchanges the characters 'a' and 'b'
"     which are next to the current position on 'X':
" map ,t XpxphXp
" map ,t xphXpxp
"
"     #b = "browse" - send selected URL to Netscape
"vmap #b y:!netscape -remote "openurl <C-R>""
"vmap #b y:!netscape -remote 'openFile(<c-r>")' \|\| netscape <c-r>" &
"vmap #b y:!netscape -remote 'openFile(%:p)' || netscape file:%:p &
"
"
" make space move the cursor to the right - much better than a *beep*
" nmap \  l
"
"     ,E = execute line
" map ,E 0/\$<CR>w"yy$:<C-R>y<C-A>r!<C-E>
" This command excutes a shell command from the current line and
" reads in its output into the buffer.  It assumes that the command
" starts with the fist word after the first '$' (the shell prompt
" of /bin/sh).  Try ",E" on that line, ie place the cursor on it
" and then press ",E":
" $ ls -la
" Note: The command line commands have been remapped to tcsh style!!
"
" ROT13 rot13
"      ,dr = decode/encode rot13 text
" vmap ,dr :!tr A-Za-z N-ZA-Mn-za-m
" Use this with an external "rot13" script:
" "    ,13 - rot13 the visual text
" vmap ,13 :!rot13<CR>
" NOTE:  Vim now has ROT13 built-in - see ":help g?".
" see also:  http://www.math.fu-berlin.de/~guckes/rot13/
"
" Give the URL under the cursor to Netscape
" map ,net yA:!netscape -remote "openurl <C-R>""
"
"
" ===================================================================
" Mapping of special keys - arrow keys and function keys.
" ===================================================================
" Buffer commands (split,move,delete) -
" this makes a little more easy to deal with buffers.
" (works for Linux PCs in room 030)
" map <F4>  :split<C-M>
" map <F5>  :bp<C-M>
" map <F6>  :bn<C-M>
" map <F12> :bd<C-M>
"
" Buffer commands (split,move,delete) -
" for Mac keyboard (Performa 5200, US keyboard)
"
" map <ESC>[19~ :split<C-M>
" map <ESC>[20~ :bp<C-M>
" map <ESC>[23~ :bn<C-M>
" map <ESC>[31~ :bd<C-M>
"
" Obvious mappings
"
" map <PageUp>   <C-B>
" map <PageDown> <C-F>
"
" ===================================================================
" FAQ:  Emacs editing"
" Q: How can I stay in insert mode and move around like within Emacs?
" A: Get the following file and source it like it is done here:
" URL:  http://www.math.fu-berlin.de/~guckes/vim/source/emacs.vim
  let FILE="/home/robinson/emailer/guckes/.P/vim/source/emacs.vim"
  if filereadable(FILE)
     let RESULT="file readable"
     exe "source " . FILE
  else
     let RESULT="file not readable"
  endif
"
" Make the up and down movements move by "display/screen lines":
"      map j      gj
"      map <Down> gj
"      map k      gk
"      map <Up>   gk
"
" Normal mode - tcsh style movements [960425]
"
" nmap <C-A>  0
" nmap <C-B>  h
" nmap <C-D>  x
" nmap <C-E>  $
" nmap <C-F>  l
" nmap <ESC>b b
" nmap <ESC>f w
"
" DOS keyboard mapping for cursor keys
"
"  map <ESC>[A <Up>
"  map <ESC>[B <Down>
"  map <ESC>[C <Right>
"  map <ESC>[D <Left>
" imap <ESC>[A <Up>
" imap <ESC>[B <Down>
" imap <ESC>[C <Right>
" imap <ESC>[D <Left>
"
" DOS keyboard
" "insert"
"  map <ESC>[1~ i
"  map <ESC>[1~ <insert>
" "home"
"  map <ESC>[2~ ^
"  map <ESC>[2~ 0
"  map <ESC>[2~ <Home>
" "pgup"
"  map <ESC>[3~ <C-B>
"  map <ESC>[3~ <PageUp>
" "delete"
"  map <ESC>[4~ x
"  map <ESC>[4~ <Del>
" "end"
"  map <ESC>[5~ $
"  map <ESC>[5~ <END>
" "pgdn"
"  map <ESC>[6~ <C-F>
"  map <ESC>[6~ <PageDown>
"
" Keyboard mapping for cursor keys
" [works for SUNs in Solarium (room 030) - 970815]
"
   map <ESC>OA <Up>
   map <ESC>OB <Down>
   map <ESC>OC <Right>
   map <ESC>OD <Left>
  imap <ESC>OA <Up>
  imap <ESC>OB <Down>
  imap <ESC>OC <Right>
  imap <ESC>OD <Left>
"
" Keyboard mapping for cursor keys
" [works for XTerminals - 970818]
   map <ESC>[A <Up>
   map <ESC>[B <Down>
   map <ESC>[C <Right>
   map <ESC>[D <Left>
  imap <ESC>[A <Up>
  imap <ESC>[B <Down>
  imap <ESC>[C <Right>
  imap <ESC>[D <Left>
"
" 000810:
" Keyboard mapping for numeric keypad:
" imap <esc>ON ???
  imap <esc>OM <c-m>
   map <esc>OM <c-m>
  imap <esc>OP <nop>
   map <esc>OP <nop>
  imap <esc>OQ /
   map <esc>OQ /
  imap <esc>OR *
   map <esc>OR *
  imap <esc>OS -
   map <esc>OS -
"
  imap <esc>Ol +
  imap <esc>Om -
  imap <esc>On ,
  imap <esc>Op 0
  imap <esc>Oq 1
  imap <esc>Or 2
  imap <esc>Os 3
  imap <esc>Ot 4
  imap <esc>Ou 5
  imap <esc>Ov 6
  imap <esc>Ow 7
  imap <esc>Ox 8
  imap <esc>Oy 9
  imap <esc>Oz 0
"
"
" ===================================================================
" AutoCommands
" ===================================================================
"
" Autocommands are the key to "syntax coloring".
" There's one command in your vimrc that should
" load/source the file $VIM/syntax/syntax.vim
" which contains the definition for colors and
" the autocommands that load other syntax files
" when necessary, ie when the filename matches
" a given pattern, eg "*.c" or *".html".
"
" just load the main syntax file when Vim was compiled with "+syntax"
  if has("syntax")
    " The following sources the main syntax file,
    " ie. "$VIM/syntax/syntax.vim", see ":help :syn-on":
      syntax on
    " Redefine the color for "Comment":
    " hi! Comment  term=bold ctermfg=cyan ctermbg=black guifg=blue guibg=black
"     hi! Comment            ctermfg=blue ctermbg=black guifg=blue guibg=black
      hi! Comment  term=NONE cterm=NONE
      hi! Comment  ctermfg=cyan ctermbg=black guifg=blue guibg=black
    "
    " The standard background color for the GUI Vim is "blue".
    " No, I don't know why.  But many users want to change this
    " color to black so they can read the blue colored text.  ;-)
    " Here's how:
    " hi normal ctermbg=black guibg=black
    "
    " Adjustments for editing messages:
    if version>=508
    " the following file contains commands
    " which simply change a few colors:
    au Syntax mail  source ~guckes/.vim.mail.vim
    endif
  endif
"
" Definition of an alternative syntax file:
" if has("syntax")
"   " Define the filename patterns for mail and news:
"   " MAILNEWSFILES... (missing, damn)
"   " Define the aucommand tow work on special files:
"     let aucommand = "au BufNewFile,BufRead ".MAILNEWSFILES
"   " execute the source command:
"     exe aucommand." source ~guckes/.P/vim/syntax/sven.vim"
"   "
" endif
"
"
" EXAMPLE: Restricting mappings to some files only:
" An autocommand does the macthing on the filenames -
" but abbreviations are not expanded within autocommands.
" Workaround:  Use "exe" for expansion:
" let aucommand = "au BufNewFile,BufRead ".MAILNEWSFILES
" exe aucommand." :map ,hi 1G}oHi!<CR><ESC>"
" exe aucommand." :map ,ha 1G}oHello, again!<CR><ESC>"
" exe aucommand." :map ,H G/Quoting /e+1<CR>ye1G}oHallo, !<ESC>Po<ESC>"
" exe aucommand." :map ,re 1G}oRe!<CR><ESC>"
"
" Automatically place the cursor onto the first line of the mail body:
" autocmd BufNewFile,BufRead MAILNEWSFILES :normal 1G}j
"
" Toggle syntax coloring on/off with "__":
" nn __ mg:if has("syntax_items")<Bar>syn clear<CR>else<Bar>syn on<CR>en<CR>`g
" Note:  It works - but the screen flashes are quite annoying.  :-/
"
 map <esc><esc> :if exists("syntax_on")\| syntax off\| else\| syntax on\| endif
"
" ===================================================================
" EXAMPLES
" ===================================================================
"
" Visualizing trailing whitespace:
" :set hls
" /\s\+$
"
" Toggling a numerical variable between two values.
" Example:  Switch the textwidth (tw) between values "70" and "80":
" map \1 :let &tw = 150 - &tw<CR>
"
" Capitalizing the previously typed word,
" returning to the previous position:
" imap CAP <ESC>mzB~`za
"
" Uppercasing the previously typed word,
" returning to the previous position:
" imap CAP <ESC>mzvBU`za
" imap CAP <ESC>mzBvaWU`za
"
" ===================================================================
" TEMPORARY STUFF - TESTING THINGS
" ===================================================================
" 001201:  Deleting text in normal mode
" using the BackSpace and Delete keys:
  nmap <BS>  X
  nmap <DEL> x
"
" 001107
" Use "bc" to evaluate the arithmetic expression on the current line
" with a precision of '6' digits after the comma.
" It is assumed that the current line contains only the expression.
" The rsult is read in after the current line.
   map #BC ^y$:r!echo 'scale=6; <c-r>"'\|bc<cr>
"
" 001010
" Add all numbers in the current visual selection.
  vmap ,add !awk '{total += $1 ; print} ; END {print total}'
"
" Example:
" Remove comments from lines, select them with 'V'
" then type ",add" and <CR> to execute "awk":
" 123
" 456
" -789
" The result should be "210".
"
"
" Narrow/Widen current paragraph by
" adjusting the current textwidth
" and using internal formatting:
  map <F5>          :set tw-=2<cr>gqip
  map <esc>[[E      :set tw-=2<cr>gqip
 vmap <F5>     <esc>:set tw-=2<cr>gvgqgv
 vmap <esc>[[E <esc>:set tw-=2<cr>gvgqgv

 vmap (        <esc>:set tw-=2<cr>gvgqgv
  map <F6>          :set tw+=2<cr>gqip
 vmap <F6>     <esc>:set tw+=2<cr>gvgqgv
 vmap )        <esc>:set tw+=2<cr>gvgqgv
"
" 001107: Use an explicit width for reformatting (here: 72):
" map <c-j> :let foo=&tw<cr>:se tw=72<cr>gqip:set tw=&foo<cr>
"
" screenshot from webpage shown with "links"
" contains escape codes which need deleting.
  vmap p :s#<c-v><esc>([0B]##g
"
"   View a html document (or part of it) with lynx. You need
"   a system that supports the /def/fd/* file descriptors :-(
" nmap ,ly :w !lynx -force_html /dev/fd/0<CR>
" vmap ,ly :w !lynx -force_html /dev/fd/0<CR>
"
" Make Vim jump back one word in normal mode with <Left>,
" when it produces the code "<Esc>OD":
" nmap <Esc>OD b
"
" Some simple example of the "expand modifiers":
" insert the current filename *with* path:
  iab YPATHFILE <C-R>=expand("%:p")<cr>
" insert the current filename *without* path:
  iab YFILE <C-R>=expand("%:t:r")<cr>
" insert the path of current file:
  iab YPATH <C-R>=expand("%:h")<cr>
  iab YDIR  <C-R>=expand("%:p:h")<cr>
" For more help see ":help filename-modifiers".
"
" Toggle highlight search and report the current value:
" map #1 :set hls!<cr>
" map #2 :echo "HLSearch: " . strpart("OffOn",3*&hlsearch,3)<cr>
" map ## #1#2
"
" Sorting current line containing a list of numbers
" map ## :s/ /<C-M>/g<CR>vip!sort -n
"
" Replying to the mutt mailing list:
" Remove header lines Cc: and Bcc: and insert [mutt] at the beginning
" map ,MM 1G/^Cc:<CR>2dd}o[mutt]<CR>
"
" map ,U %s#<URL:\(.*\)>#<a href="\1"></a>#gc
" map ,F {jma}kmb:'a,'b!sed -e "s/^>//"<C-V><C-V>|\
"        sed -f ~/.P/elm/scripts/weedout.sed
" map ,mb ebi<CR><b><ESC>Ea</b><CR><ESC>dw
"
" stripping netscape bookmarks and making them list items
" vmap ,ns :.,$s/^ *<DT><\(A.*"\) ADD.*">\(.*\)$/<li> <\1><C-M><C-I>\2/
"
" Jump to the last space before the 80th column.
" map ,\| 80\|F<space>
"
" extracting variable names from mutt's init.c
" :%s/^.*"\([a-z0-9_]*\)".*$/\1/
"
"     \<> = change to <> notation by substituting ^M and ^[
" cab \<> s/<C-V><ESC>/<ESC>/gc<C-M>:s/<C-V><C-M>/<C-M>/gc<C-M>
"
" Changing the From_ line in pseudo mail folders to an appropriate
"  value - so you can read them with a mailer.
" %s/^From /From guckes Thu Apr  6 12:07:00 1967/
"
" ===================================================================
" ASCII tables - you may need them some day.  Save them to a file!
" ===================================================================
"
" 001005: In need of an ASII table?  Perl is your friend:
"         perl -e 'while($i++<256) { print chr($i); }'
"
" ASCII Table - | octal value - name/char |
"
" |000 nul|001 soh|002 stx|003 etx|004 eot|005 enq|006 ack|007 bel|
" |010 bs |011 ht |012 nl |013 vt |014 np |015 cr |016 so |017 si |
" |020 dle|021 dc1|022 dc2|023 dc3|024 dc4|025 nak|026 syn|027 etb|
" |030 can|031 em |032 sub|033 esc|034 fs |035 gs |036 rs |037 us |
" |040 sp |041  ! |042  " |043  # |044  $ |045  % |046  & |047  ' |
" |050  ( |051  ) |052  * |053  + |054  , |055  - |056  . |057  / |
" |060  0 |061  1 |062  2 |063  3 |064  4 |065  5 |066  6 |067  7 |
" |070  8 |071  9 |072  : |073  ; |074  < |075  = |076  > |077  ? |
" |100  @ |101  A |102  B |103  C |104  D |105  E |106  F |107  G |
" |110  H |111  I |112  J |113  K |114  L |115  M |116  N |117  O |
" |120  P |121  Q |122  R |123  S |124  T |125  U |126  V |127  W |
" |130  X |131  Y |132  Z |133  [ |134  \ |135  ] |136  ^ |137  _ |
" |140  ` |141  a |142  b |143  c |144  d |145  e |146  f |147  g |
" |150  h |151  i |152  j |153  k |154  l |155  m |156  n |157  o |
" |160  p |161  q |162  r |163  s |164  t |165  u |166  v |167  w |
" |170  x |171  y |172  z |173  { |174  | |175  } |176  ~ |177 del|
"
" ===================================================================
" ASCII Table - | decimal value - name/char |
"
" |000 nul|001 soh|002 stx|003 etx|004 eot|005 enq|006 ack|007 bel|
" |008 bs |009 ht |010 nl |011 vt |012 np |013 cr |014 so |015 si |
" |016 dle|017 dc1|018 dc2|019 dc3|020 dc4|021 nak|022 syn|023 etb|
" |024 can|025 em |026 sub|027 esc|028 fs |029 gs |030 rs |031 us |
" |032 sp |033  ! |034  " |035  # |036  $ |037  % |038  & |039  ' |
" |040  ( |041  ) |042  * |043  + |044  , |045  - |046  . |047  / |
" |048  0 |049  1 |050  2 |051  3 |052  4 |053  5 |054  6 |055  7 |
" |056  8 |057  9 |058  : |059  ; |060  < |061  = |062  > |063  ? |
" |064  @ |065  A |066  B |067  C |068  D |069  E |070  F |071  G |
" |072  H |073  I |074  J |075  K |076  L |077  M |078  N |079  O |
" |080  P |081  Q |082  R |083  S |084  T |085  U |086  V |087  W |
" |088  X |089  Y |090  Z |091  [ |092  \ |093  ] |094  ^ |095  _ |
" |096  ` |097  a |098  b |099  c |100  d |101  e |102  f |103  g |
" |104  h |105  i |106  j |107  k |108  l |109  m |110  n |111  o |
" |112  p |113  q |114  r |115  s |116  t |117  u |118  v |119  w |
" |120  x |121  y |122  z |123  { |124  | |125  } |126  ~ |127 del|
"
" ===================================================================
" ASCII Table - | hex value - name/char |
"
" | 00 nul| 01 soh| 02 stx| 03 etx| 04 eot| 05 enq| 06 ack| 07 bel|
" | 08 bs | 09 ht | 0a nl | 0b vt | 0c np | 0d cr | 0e so | 0f si |
" | 10 dle| 11 dc1| 12 dc2| 13 dc3| 14 dc4| 15 nak| 16 syn| 17 etb|
" | 18 can| 19 em | 1a sub| 1b esc| 1c fs | 1d gs | 1e rs | 1f us |
" | 20 sp | 21  ! | 22  " | 23  # | 24  $ | 25  % | 26  & | 27  ' |
" | 28  ( | 29  ) | 2a  * | 2b  + | 2c  , | 2d  - | 2e  . | 2f  / |
" | 30  0 | 31  1 | 32  2 | 33  3 | 34  4 | 35  5 | 36  6 | 37  7 |
" | 38  8 | 39  9 | 3a  : | 3b  ; | 3c  < | 3d  = | 3e  > | 3f  ? |
" | 40  @ | 41  A | 42  B | 43  C | 44  D | 45  E | 46  F | 47  G |
" | 48  H | 49  I | 4a  J | 4b  K | 4c  L | 4d  M | 4e  N | 4f  O |
" | 50  P | 51  Q | 52  R | 53  S | 54  T | 55  U | 56  V | 57  W |
" | 58  X | 59  Y | 5a  Z | 5b  [ | 5c  \ | 5d  ] | 5e  ^ | 5f  _ |
" | 60  ` | 61  a | 62  b | 63  c | 64  d | 65  e | 66  f | 67  g |
" | 68  h | 69  i | 6a  j | 6b  k | 6c  l | 6d  m | 6e  n | 6f  o |
" | 70  p | 71  q | 72  r | 73  s | 74  t | 75  u | 76  v | 77  w |
" | 78  x | 79  y | 7a  z | 7b  { | 7c  | | 7d  } | 7e  ~ | 7f del|
" ===================================================================
" Yet another example for an autocommand:  [980616]
  au VimLeave * echo "Thanks for using Vim"version". --Sven Guckes@vim.org!"
" ===================================================================
" Last but not least...
" =====================================================
" The last line is allowed to be a "modeline" with my setup.
" It gives vim commands for setting variable values that are
" specific for editing this file.  Used mostly for setting
" the textwidth (tw) and the "shiftwidth" (sw).
" Note that the colon within the value of "comments" needs to
" be escaped with a backslash!  (Thanks, Thomas!)
"       vim:tw=70 et sw=4 comments=\:\"

