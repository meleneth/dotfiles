version 6.0
set noautoindent
set nobackup
set bs=2
set background=dark
set nocompatible
set comments=b:#,:%,fb:-,n:>,n:)
set esckeys
set expandtab
set fo=cqrt
set hidden
set iskeyword=@,48-57,_,192-255,-,.,:,/,@-@
set lazyredraw
set display=uhex
"set listchars=tab:»·,trail:·
set smartindent
set statusline=[%n]\ %F\ %(\ %M%R%H)%)\ \@(%l\,%c%V)\ %P
"hi normal ctermfg=white ctermbg=black guifg=white guibg=black
hi nontext ctermfg=blue ctermbg=black guifg=blue guibg=black
set guifont=kates
set sw=2 ts=2
"autocmds
autocmd!

set showmatch

au BufNewFile,BufRead *.php set number ai et sw=4 ts=4
au BufNewFile,BufRead *.py set number ai et sw=4 ts=4
au BufNewFile,BufRead *.js set number ai et sw=2 ts=2
au BufNewFile,BufRead *.rb set number ai et sw=2 ts=2
au BufNewFile,BufRead *.html set filetype=mason sw=2 ts=2
au FileType c set ai sw=4 ts=4 foldmethod=indent
au BufNewFile,BufRead Makefile set noexpandtab 
au BufNewFile,BufRead afiedit.buf set ft=sql 
au BufRead,BufNewFile *.m  setfiletype objc

" Toggle fold state between closed and opened. 
" 
" If there is no fold at current line, just moves forward. 
" If it is present, reverse it's state. 
fun! ToggleFold() 
if foldlevel('.') == 0 
normal! l 
else 
if foldclosed('.') < 0 
. foldclose 
else 
. foldopen 
endif 
endif 
" Clear status line 
echo 
endfun 

" Map this function to Space key. 
noremap <space> :call ToggleFold()<CR> 


"hi! Comment            ctermfg=blue ctermbg=black guifg=blue guibg=black
"hi normal ctermbg=black guibg=black
syn on
set laststatus=2
set number

"some colors for syntax highlighting
hi Comment    ctermfg=cyan 
hi Constant   ctermfg=Magenta 
hi Special    ctermfg=LightRed 
hi Identifier cterm=bold ctermfg=LightGreen
hi Statement  ctermfg=Yellow 
hi PreProc    ctermfg=LightBlue 
hi Type       ctermfg=green
hi ErrorMsg   ctermfg=red
set showmatch
color elflord

set autoindent

set incsearch
set hlsearch

function! Auto_Tableize()
perl << CTRLD
	sub _is_part_of_table {
	    return $_[0] =~ /^\s*[[({].*\S/
                    || $_[0] =~ /=>/
                    || $_[0] =~ /^\s*$/;
        }

        sub _first_line_in_table {
            my $first_line = ($curwin->Cursor())[0];
            while ($first_line > 0 && _is_part_of_table($curbuf->Get($first_line))) {
                $first_line--;
            }
            return $first_line + 1;
        }

        sub _last_line_in_table {
            my $last_line = ($curwin->Cursor())[0];
            while (_is_part_of_table($curbuf->Get($last_line))) {
                $last_line++;
            }
            return $last_line - 1;
        }


        use IPC::Open2;
        local(*INPUT, *OUTPUT);
        open2(\*INPUT, \*OUTPUT,
            'perl', '-MRTK::Text::Tableize', '-e', 'print tableize(<>)');
        print OUTPUT join("\n", $curbuf->Get(_first_line_in_table() .. _last_line_in_table())), "\n";
        close OUTPUT;

        chomp(my @formatted = <INPUT>);
        close INPUT;

        $curbuf->Set(_first_line_in_table(), @formatted);
CTRLD
endfunction

map! ,& &amp;
map! ,< &lt;
map! ,> &gt;
map! ,ar <%args><CR><CR></%args><ESC>ka<TAB>
map! ,fl <%flags><CR><CR></%flags><ESC>ka<TAB>
map! ,cl class=""<ESC>i
map! ,dc <div class="code"><pre></pre></div><ESC>4ba
map! ,de <%def><CR><CR></%def><ESC>ka<TAB>
map! ,di <div></div><ESC>2ba
map! ,for <form action="" method="post"></form><ESC>3hi
map! ,h1 <h1></h1><ESC>2ba
map! ,h2 <h2></h2><ESC>2ba
map! ,h3 <h3></h3><ESC>2ba
map! ,h4 <h4></h4><ESC>2ba
map! ,ini <%init><CR><CR></%init><ESC>ka<TAB>
map! ,inp <input type="" name="" value="" /><ESC>3hi
map! ,li <li></li><ESC>2ba
map! ,m <&  &><ESC>2hi
map! ,nb &nbsp;
map! ,ol <ol></ol><ESC>2ba
map! ,on <%once><CR><CR></%once><ESC>ka<TAB>
map! ,A <%attr><CR><CR></%attr><ESC>ka<TAB>
map! ,p <p></p><ESC>2ba
map! ,pr <pre></pre><ESC>2ba
map! ,sp <span></span><ESC>2ba
map! ,ta <table></table><ESC>2ba
map! ,td <td></td><ESC>2ba
map! ,te <input type="text" name="" value="" /><ESC>12hi
map! ,tr <tr></tr><ESC>2ba
map! ,ul <ul></ul><ESC>2ba
map! ,v <%  %><ESC>2hi
map! ,newpm package RTK:: ;<CR><CR>use strict;<CR>use ReasonableParams;<CR>use AppropriateLibrary;<CR><CR>1;<CR>
map! ,sub sub )<CR>{<CR>}<CR><CR><ESC>4bi
map! ,exp use base qw/Exporter/;<CR>use vars qw/@EXPORT_OK/;<CR>@EXPORT_OK = qw/
map! ,fr Uint32 max_no = .size();<CR>for(Uint32 i=0; i<max_no; ++i){<CR>[i];}<ESC>bi
map ,d :set nowrap<CR>:CVSVimDiff<CR>:redraw!<CR>


map <F2> :bp<CR>
map! <F2> <ESC>:bp<CR>
map <F3> :bn<CR>
map! <F3> <ESC>:bn<CR>
map! <F8> <ESC>\be
map <F8> \be
map <F9> :w<CR>:make<CR> 
map! <F9> <ESC>:w<CR>:make<CR> 
map <F10> <ESC>:TlistToggle<CR> 
map! <F10> <ESC>:TlistToggle<CR> 
map <F5> :e .<CR> 
map! <F5> <ESC>:e .<CR> 
map <F4> :e %:p:s,.hpp$,.X123X,:s,.cpp$,.hpp,:s,.X123X$,.cpp,<CR>

"set list
