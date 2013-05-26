##########################################################################{{{1
# file:		~/.profile
# author:	luc
# vim:          spelllang=en filetype=sh foldmethod=marker
# credits:
##############################################################################

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# for debugging purpous
#set -x

# source local profile files
[ -r ~/.profile_`hostname` ] && . ~/.profile_`hostname`
[ -r ~/.profile_local ] && . ~/.profile_local

# fix PATH
[ -d "$HOME/bin" ] && PATH="$HOME/bin:$PATH"

### FROM MATH.CIP
#################
## remap capslock
#if [ -z "$SSH_CLIENT" -a -n "$DISPLAY" ]; then
#  xmodmap -e "add control = Caps_Lock"
#fi
#
#if [ -n "$SSH_CLIENT" ]; then
#  calendar
#  exec zsh
#fi


#if we are running bash try to source ~/.bashrc
#[ "${BASH-no}" != no ] && [ -r ~/.bashrc ] && . ~/.bashrc
#[ "$ZSH_NAME" = zsh ] && [ -r $ZDOTDIR/.zshrc ] && . $ZDOTDIR/.zshrc


# start X
if [ `uname` = Linux ]; then
  startx
fi
