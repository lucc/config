# file:    zshrc                                                          {{{1
# author:  luc
# vim:     foldmethod=marker
# credits: many thanks to the people from
#          http://stevelosh.com/blog/2010/02/my-extravagant-zsh-prompt
#          http://aperiodic.net/phil/prompt
#          http://crunchbanglinux.org/forums/topic/4062/zsh-is-awesome
#          http://www.sourceguru.net/ssh-host-completion-zsh-stylee
#          http://serverfault.com/questions/170346
#          https://maze.io/2008/08/03/remote-tabcompletion-using-openssh-and-zsh
##############################################################################

#  local variables (unset at eof) {{{1
######################################
# This variable will expand to the nullstring if we are not on Mac OS X or
# brew is not installed.
BREW=`brew --prefix 2>/dev/null`

# files to be sourced {{{1
##########################
if [[ -r $ZDOTDIR/aliases ]]; then . $ZDOTDIR/aliases; fi
if [[ -r $ZDOTDIR/private ]]; then . $ZDOTDIR/private; fi
if [[ -r $BREW/etc/profile.d/z.sh ]]; then
  # read man z
  _Z_CMD=j . $BREW/etc/profile.d/z.sh
elif [[ -r /usr/share/autojump/autojump.sh ]]; then
  #export AUTOJUMP_KEEP_SYMLINKS=1
  . /usr/share/autojump/autojump.sh
elif [[ -r $BREW/etc/autojump.sh ]]; then
  #export AUTOJUMP_KEEP_SYMLINKS=1
  . $BREW/etc/autojump.sh
fi

# prompt {{{1
#############

# precommand functions {{{2

# functions to dispay info in the prompts
function right-prompt-function () {
  if [[ `ls ~/mail/gmx/new | wc -l` -ne 0 ]]; then
    echo '%B%F{red}Mail for mac_fan@gmx.de!%f%b'
  elif mailcheck | grep -q " new "; then
    echo '%B%F{blue}You have mail!%f%b'
  elif [[ `uname` = Darwin ]]; then
    echo "${vcs_info_msg_0_} `battery.sh -bce zsh`"
  fi
}

#function chpwd () { _z --add "$(pwd -P)"; }
#function precmd () { _z --add "$(pwd -P)"; }
precmd () { vcs_info }

# main prompt {{{2

# PS1 prompt
# old versions:
PS1="%(?..%F{red}Error: %?%f
)[ %F{green}%n%F{cyan}@%F{blue}%m%f | %F{cyan}%1~%f | %D{%H:%M:%S} ] "
PS1="[ %F{green}%n%F{cyan}@%F{blue}%m%f | %F{cyan}%1~%f | %D{%H:%M:%S} %(?..| %F{red}%?%f )] "
PS1="[ %F{green}%n%F{cyan}@%F{blue}%m%f | %F{cyan}%1~%f | %D{%H:%M:%S} | %(?..%F{red})%?%f ] "
PS1="[ %F{green}%n%F{cyan}@%F{blue}%m%f | %F{cyan}%1~%f | %D{%H:%M:%S} %(?..| %F{red}%?%f )] "
PS1="[ %(?.%F{green}%n%F{cyan}@%F{blue}%m%f | %F{cyan}%1~%f | %D{%H:%M:%S}.%F{blue}\$history[\$[HISTCMD-1]]%f -> %F{red}%?%f) ] "
# current version:
PS1="[ %F{green}%n%F{cyan}@%F{blue}%m%f | %F{cyan}%1~%f | %D{%H:%M:%S} ] "

# RPS1 prompt
RPROMPT='%(?.$(right-prompt-function).%F{red}Error: %?)'

# options {{{1
##############

# contolling the history
HISTFILE=$ZDOTDIR/histfile
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_all_dups
setopt hist_expire_dups_first
setopt hist_find_no_dups
setopt hist_reduce_blanks
setopt hist_save_no_dups
setopt hist_ignore_space
#setopt hist_verify

# options
setopt extended_glob
setopt no_no_match
setopt prompt_subst

# interesting options:
setopt auto_cd
setopt glob_dots
#setopt print_exit_value
setopt no_list_ambiguous

# keybindings {{{1
##################
bindkey -v

# searching {{{2
bindkey -M viins '\C-r' history-incremental-pattern-search-backward
bindkey -M vicmd '\C-r' history-incremental-pattern-search-backward
bindkey -M viins '\C-s' history-incremental-pattern-search-forward
bindkey -M vicmd '\C-s' history-incremental-pattern-search-forward

# arrow keys {{{2
bindkey -M viins '\e[A' up-line-or-search
bindkey -M vicmd '\e[A' up-line-or-search
bindkey -M viins '\e[B' down-line-or-search
bindkey -M vicmd '\e[B' down-line-or-search

if [[ `uname` = Darwin ]]; then
  bindkey -M viins '\e[H' beginning-of-line
  bindkey -M vicmd '\e[H' beginning-of-line
  bindkey -M viins '\e[F' end-of-line
  bindkey -M vicmd '\e[F' end-of-line
  bindkey -M viins '\e[1;2C' vi-forward-word
  bindkey -M vicmd '\e[1;2C' vi-forward-word
  bindkey -M viins '\e[1;2D' vi-backward-word
  bindkey -M vicmd '\e[1;2D' vi-backward-word
elif [[ `uname` = Linux ]]; then
  if [[ "$TERM" =~ rxvt ]]; then
    bindkey -M viins '\e[7~' beginning-of-line
    bindkey -M vicmd '\e[7~' beginning-of-line
    bindkey -M viins '\e[8~' end-of-line
    bindkey -M vicmd '\e[8~' end-of-line
    bindkey -M viins '\e[c' vi-forward-word
    bindkey -M vicmd '\e[c' vi-forward-word
    bindkey -M viins '\e[d' vi-backward-word
    bindkey -M vicmd '\e[d' vi-backward-word
  else
    bindkey -M viins '\eOH' beginning-of-line
    bindkey -M vicmd '\eOH' beginning-of-line
    bindkey -M viins '\eOF' end-of-line
    bindkey -M vicmd '\eOF' end-of-line
  fi
fi

# zle stuff {{{1
################
zle_highlight=(region:bg=green special:bg=blue suffix:fg=red isearch:fg=yellow)

# completion {{{1
#################

# layout {{{2

zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' file-sort name
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s

# performemce {{{2

zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path $ZDOTDIR/cache

# ssh hosts {{{2
# many thanks to http://www.sourceguru.net/ssh-host-completion-zsh-stylee/

# is there already something saved in $hosts?
if [[ -f ~/.ssh/config ]]; then
  #hosts=($hosts `sed -n '/\*/d;/^Host/s/^Host[=\t ]*//p' ~/.ssh/config`)
  # from http://serverfault.com/questions/170346
  hosts=($hosts ${${${(@M)${(f)"$(<~/.ssh/config)"}:#Host *}#Host }:#*[*?]*})
fi
if [[ -f ~/.ssh/known_hosts ]]; then
  #hosts=($hosts `awk '{print $1}' ~/.ssh/known_hosts | tr ',' '\n'`)
  # this looks for the files /etc/ssh_hosts /etc/ssh_hosts2 ~/.ssh/known_hosts
  # ~/.ssh/known_hosts2
  hosts=($hosts ${=${${(f)"$(cat {/etc/ssh_,~/.ssh/known_}hosts(|2)(N) /dev/null)"}%%[# ]*}//,/ })
fi
if [[ -f /var/lib/misc/ssh_known_hosts ]]; then
  hosts=($hosts `awk -F "[, ]" '{print $1}' /var/lib/misc/ssh_known_hosts | sort -u`)
fi
if [[ -f ~/.netrc ]]; then
  hosts=($hosts `sed -n '/^machine/s/^machine //p' ~/.netrc`)
fi
if [[ $#hosts -gt 0 ]]; then
  zstyle ':completion:*:hosts' hosts $hosts
  # from http://serverfault.com/questions/170346
  #zstyle ':completion:*:ssh:*' hosts $hosts
  #zstyle ':completion:*:slogin:*' hosts $hosts
  zstyle ':completion:*(ssh|scp):*:users' ignored-patterns daemon _*
fi

# TODO
# from https://maze.io/2008/08/03/remote-tabcompletion-using-openssh-and-zsh {{{3
## ssh, scp, ping, host
#zstyle ':completion:*:scp:*' tag-order \
#      'hosts:-host hosts:-domain:domain hosts:-ipaddr:IP\ address *'
#zstyle ':completion:*:scp:*' group-order \
#      users files all-files hosts-domain hosts-host hosts-ipaddr
#zstyle ':completion:*:ssh:*' tag-order \
#      users 'hosts:-host hosts:-domain:domain hosts:-ipaddr:IP\ address *'
#zstyle ':completion:*:ssh:*' group-order \
#      hosts-domain hosts-host users hosts-ipaddr
#
#zstyle ':completion:*:(ssh|scp):*:hosts-host' ignored-patterns \
#      '*.*' loopback localhost
#zstyle ':completion:*:(ssh|scp):*:hosts-domain' ignored-patterns \
#      '<->.<->.<->.<->' '^*.*' '*@*'
#zstyle ':completion:*:(ssh|scp):*:hosts-ipaddr' ignored-patterns \
#      '^<->.<->.<->.<->' '127.0.0.<->'
#zstyle ':completion:*:(ssh|scp):*:users' ignored-patterns \
#      adm bin daemon halt lp named shutdown sync
#
## If you also want tab completion of the hosts listed in your
## ~/.ssh/known_hosts and /etc/hosts files, you can add:
#zstyle -e ':completion:*:(ssh|scp):*' hosts 'reply=(
#      ${=${${(f)"$(cat {/etc/ssh_,~/.ssh/known_}hosts(|2)(N) \
#                      /dev/null)"}%%[# ]*}//,/ }
#      ${=${(f)"$(cat /etc/hosts(|)(N) <<(ypcat hosts 2>/dev/null))"}%%\#*}
#      ${=${${${${(@M)${(f)"$(<~/.ssh/config)"}:#Host *}#Host }:#*\**}:#*\?*}}
#      )'

# other {{{2

zstyle ':completion:*' completer _expand _complete _ignored
zstyle ':completion:*' expand prefix suffix
zstyle ':completion:*' special-dirs true
zstyle ':completion:*' ignore-parents parent pwd ..
#TODO
zstyle ':completion:*:cd:*' ignored-patterns . 
zstyle ':completion:*' list-suffixes true
zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}'
zstyle ':completion:*' original false
zstyle ':completion:*' squeeze-slashes true
zstyle ':completion:*' verbose true
#zstyle ':completion:*' format 'Completing %d'
#zstyle ':completion:*' insert-unambiguous true
#zstyle :compinstall filename '/Users/lucas/.zshrc'

# VCS stuff {{{2
autoload -Uz vcs_info
#zstyle ':vcs_info:*' unstagedstr 
zstyle ':vcs_info:*' actionformats '%s%F{5}:%F{2}%b%F{3}|%F{1}%a%f'
#TODO
zstyle ':vcs_info:*' formats       '%s%F{5}:%F{2}%b%F{red}%u%f'
#zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{1}:%F{3}%r'
zstyle ':vcs_info:*' enable git svn


# starting the completion system {{{2
autoload -Uz compinit
compinit

#  OTHER STUFF {{{1
###################
[ -r =dircolors ] && eval `dircolors -b`

#  UNSET LOCAL VARIABLES {{{1
#############################
unset BREW
