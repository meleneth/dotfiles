# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files for examples

export CVS_RSH=ssh
export RSYNC_RSH=ssh

# If running interactively, then:
if [ "$PS1" ]; then

#export TERM=linux

# enable color support of ls and also add handy aliases

alias ls="ls --color"

#eval `dircolors`
alias x="ssh-agent startx & exit"
alias mdu='du -h --max-depth 1 |grep M |sort -g'

# set a fancy prompt
#change these if you don't dig my colors!
#* 0 All attributes OFF
#* 1 Bold ON
#* 4 Underscore ON (monochrome only)
#* 5 Blink ON
#* 7 Reverse Video ON
#* 8 Concealed ON
#* 30 Black Foreground
#* 31 Red
#* 32 Green
#* 33 Yellow
#* 34 Blue
#* 35 Magenta
#* 36 Cyan
#* 37 White
#* 40 Black Background
#* 41 Red
#* 42 Green
#* 43 Yellow
#* 44 Blue
#* 45 Magenta
#* 46 Cyan
#* 47 White

    NM="\[\033[0;1;37m\]" #means no background and wihite lines
    HI="\[\033[0;1;34m\]" #change this for letter colors
    HN="\[\033[0;36m\]" # hostname colors
    SI="\[\033[0;31m\]" #this is for the current directory
    NI="\[\033[0;1;36m\]" #for @ symbol
    IN="\[\033[0;1;32m\]"
    LG="\[\033[0;1;37m\]" # Light Grey
    DG="\[\033[0;37m\]" # Dark Grey
    PS1="$LGÚ$DGÄ[$HN\u $NI@ $HN\h \w$DG]Ä$LGÄ¿\n$LGÀÄ$DGÄ\$$IN"
    PS1="$NM[=- $HI\u$NI@$HN\h $SI\w$NM -=]\n  \$$IN"
fi

export EDITOR=vim
export PATH=$PATH:~/bin

mkdir -p ~/var

alias bigfiles="du -h -x > /tmp/tmpfile.$PPID ; cat /tmp/tmpfile.$PPID | egrep ^[0-9\.]+G |sort -nr ; cat /tmp/tmpfile.$PPID |egrep ^[0-9\.]+M |sort -nr | head -n 40"
alias verifydisc="mount /cdrom ; cd /cdrom ; cfv -r ; cd -"
alias cst="cvs status |grep File |grep -v Up-to"
alias loc="find . |grep"
alias mp2mp3='for i in *.mp2 ; do mv "$i" "`echo \"$i\" | sed s/mp2/mp3/`" ; done'
alias slf="cvs -nq update"
alias start-agent="ssh-agent -s| grep -v echo > ~/.agent_cmd ; . ~/.agent_cmd"
alias wt="wt_test"
alias generate-sfv="cfv -r -v -C -t sfv ."
alias vidplay="mplayer -vo xv -ao alsa"
alias make-chunked-rars="rar a -m5 -v153600k" 
alias bmd="btlaunchmanycurses . --minport 40000 --maxport 40005 --max_upload_rate 30"

alias sd1="pwd > ~/var/dir1"
alias sd2="pwd > ~/var/dir2"
alias sd3="pwd > ~/var/dir3"
alias sd4="pwd > ~/var/dir4"
alias t1="cd \`cat ~/var/dir1\`"
alias t2="cd \`cat ~/var/dir2\`"
alias t3="cd \`cat ~/var/dir3\`"
alias t4="cd \`cat ~/var/dir4\`"
alias st="for i in ~/var/dir* ; do echo \$i ; cat \$i ; echo ; done"

umask 002


if [ -f ~/dotfiles/bash/${HOSTNAME}.bashrc ]; then
    . ~/dotfiles/bash/${HOSTNAME}.bashrc
fi

if [ -f ~/.agent_cmd ]; then
    . ~/.agent_cmd
fi

export EVENT_NOKQUEUE=1

export CLICOLOR=1
export LSCOLORS=HxFxCxDxBxegedabagacad

export CAP_USER=jason

alias ri="ri -Tf ansi"
alias make="make -j 16"

alias rt="rake test > test_output.txt 2>&1 ; less test_output.txt"

