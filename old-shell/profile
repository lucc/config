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

# source local profile files and other files (set up env)
for file in \
  ~/.config/shell/envrc \
  ~/.profile_`hostname` \
  ~/.profile_local \
  ; do
  if [ -r $file ]; then . $file; fi
done

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
