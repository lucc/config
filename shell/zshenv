##########################################################################{{{1
# file:    zshrc 
# author:  luc
# vim:     foldmethod=marker
# credits:
##############################################################################

# ZDOTDIR is used to find init files
ZDOTDIR=$HOME/.config/shell

# load general settings
if [[ -r $ZDOTDIR/envrc ]]; then . $ZDOTDIR/envrc; fi

# zsh specific settings

# file endings to ignore for completion
fignore=(${fignore[@]} '~' .o .bak .swp)

# functions for completion
for trypath in \
    /usr/local/share/zsh-completions \
    $ZDOTDIR/functions \
  ; do
  if [[ -d $trypath ]]; then
    fpath=($trypath $fpath)
  fi
done
