# ~/.bashrc file by luc
#+ many thanks to the people from
#+	http://crunchbanglinux.org/forums/topic/1093/post-your-bashrc/
#+	http://wiki.archlinux.org/index.php/Color_Bash_Prompt
##############################################################################
# If not running interactively, don't do anything
if [[ -z $PS1 ]]; then return; fi

##############################################################################
#  SHELL VARIABLES
##############################################################################
HISTCONTROL=erasedups 		# save same line to history only once
FIGNORE='~:.o:.bak:.swp'	# also see "shopt -u force_fignore"

##############################################################################
#  LOCAL VARIABLES (UNSET AT EOF)
##############################################################################
RS='\[\033[m\]'   # reset all plain
HI='\[\033[1m\]'  # hicolor
UL='\[\033[4m\]'  # underline
# foreground		# backgroung		# color
FN='\[\033[30m\]' 	BN='\[\033[40m\]' 	# black
FR='\[\033[31m\]' 	BR='\[\033[41m\]' 	# red
FG='\[\033[32m\]' 	BG='\[\033[42m\]' 	# green
FY='\[\033[33m\]' 	BY='\[\033[43m\]' 	# yellow
FB='\[\033[34m\]' 	BB='\[\033[44m\]' 	# blue
FP='\[\033[35m\]' 	BP='\[\033[45m\]' 	# purple
FC='\[\033[36m\]' 	BC='\[\033[46m\]' 	# cyan
FW='\[\033[37m\]' 	BW='\[\033[47m\]' 	# white
# This variable will expand to the nullstring if we are not on Mac OS X or brew
# is not installed.
BREW=`brew --prefix 2>/dev/null`

##############################################################################
#  ALIAS & FILES TO SOUCE
##############################################################################
# See /usr/share/doc/bash-doc/examples in the bash-doc package.
if [[ -r $HOME/.envrc   ]]; then . $HOME/.envrc;   fi
if [[ -r $HOME/.aliases ]]; then . $HOME/.aliases; fi
if [[ -r $HOME/.private ]]; then . $HOME/.private; fi

# enable programmable completion features (you don't need to enable this, if
# it's already enabled in /etc/bashrc and /etc/profile sources /etc/bashrc).
if [[ -r $BREW/etc/bash_completion ]]; then . $BREW/etc/bash_completion; fi

# make less more friendly for non-text input files, see lesspipe(1)
if [[ -x /usr/bin/lesspipe ]]; then eval "$(lesspipe)"
elif [[ -x $BREW/bin/lesspipe.sh ]]; then eval "$(lesspipe.sh)"
fi

# read man z
if [[ -r $BREW/etc/profile.d/z.sh ]]; then _Z_CMD=j . $BREW/etc/profile.d/z.sh; fi

##############################################################################
#  PROMPT
##############################################################################
if echo "$PROMPT_COMMAND" | grep -vq '_r=\$?'; then # for the PS1 prompt.
  PROMPT_COMMAND='_r=$?'";$PROMPT_COMMAND"
fi
PS1="[ $FG\u$FC@$FB\h $RS| $FC\W $RS| \t | \`[[ \$? -ne 0 ]]&&echo '$FR'\`\$_r $RS] "

#############################################################################
#  SHELL OPTIONS
##############################################################################
set -o vi		# use vi like line editing. (start with ESC)
shopt -s checkwinsize 	# check window size after a process completes
shopt -u force_fignore 	# don't complete w/ <TAB> iff other files available
shopt -s extglob 	# ?: "<=1", *: "any", +: "<0", @: "=", !: "not" 
#shopt -s gnu_errfmt 	# what would it do??
#shopt -s hostcomplete 	# why is this sop buggy??

##############################################################################
# TODO
##############################################################################
# this and dircolors in general
#if [ "$TERM" != "dumb" ]; then eval "`dircolors -b`"; fi

##############################################################################
#  UNSET LOCAL VARIABLES
##############################################################################
unset BREW PREFIX
unset RS HI UL {F,B}{N,R,G,Y,B,P,C,W}		# dont clutter env
