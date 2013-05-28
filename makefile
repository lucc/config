# makefile to create and remove links from $HOME to the dotfile directory

# functions
map         = $(foreach a,$(2),$(call $(1),$(a)))
tail        = $(lastword $(subst $(SEP), ,$(1)))
islink      = $(shell cd && if [ -L $(1) ]; then echo $(1); fi)
link        = $(LN) $(DIR)/$(subst $(SEP), ,$(1))
echoandlink = echo $(call link,$(1)); cd && $(call link,$(1));

# variables
SEP         = :
DIR         = $(strip $(subst $(HOME)/, , $(realpath $(dir $(MAKEFILE_LIST)))))
LN          = ln -s
# this is ugly because I need pairs.
CONFIGS     = \
	      abcde.conf$(SEP).abcde.conf           \
	      antiword$(SEP).antiword               \
	      ctags$(SEP).ctags                     \
	      emacs.d$(SEP).emacs.d                 \
	      htoprc$(SEP).htoprc                   \
	      latexmkrc$(SEP).latexmkrc             \
	      mailcap$(SEP).mailcap                 \
	      mailcheckrc$(SEP).mailcheckrc         \
	      mime.types$(SEP).mime.types           \
	      mpd$(SEP).mpd                         \
	      inputrc$(SEP).inputrc                 \
	      mutt$(SEP).mutt               \
	      pentadactyl$(SEP).pentadactyl         \
	      pentadactylrc$(SEP).pentadactylrc     \
	      gitconfig$(SEP).gitconfig     \
	      pystartup$(SEP).pystartup             \
	      rtorrent.rc$(SEP).rtorrent.rc         \
	      fetchmailrc$(SEP).fetchmailrc \
	      secure/gpg$(SEP).gnupg                \
	      secure/netrc$(SEP).netrc              \
	      secure/ssh$(SEP).ssh                  \
	      secure/vimpressrc$(SEP).vimpressrc    \
	      shell/profile$(SEP).profile           \
	      shell/zshenv$(SEP).zshenv             \
	      tmux.conf$(SEP).tmux.conf             \
	      vim$(SEP).vim                         \
	      vim/gvimrc$(SEP).gvimrc               \
	      vim/vimpagerrc$(SEP).vimpagerrc       \
	      vim/vimrc$(SEP).vimrc                 \

UNUSED      = \
              conkyrc$(SEP).conkyrc \
              pal$(SEP).pal         \

links: clean
	@$(foreach pair,$(CONFIGS) $(SECURE),$(call echoandlink,$(pair)))
clean:
	cd && $(RM) $(call map,islink,$(call map,tail,$(CONFIGS)))
other:
	$(RM) $(HOME)/$(DIR)/mutt/profiles/all
	$(LN) $(HOME)/$(DIR)/secure/mutt-profiles $(HOME)/$(DIR)/mutt/profiles/all
update:
	git submodule update --recursive
init:
	git submodule update --recursive --init

# from the backup.make file
CONFIGDIRS   = \
	      .abook            \
	      .config           \
	      .cups             \
	      .easytag          \
	      .elinks           \
	      .epspdf           \
	      .fontconfig       \
	      .gem              \
	      .inkscape-etc     \
	      .links            \
	      .local            \
	      .lyra             \
	      .MacOSX           \
	      .mc               \
	      .mu               \
	      .netbeans         \
	      .NetBeansProjects \
	      .npm              \
	      .postfix          \
	      .subversion       \
	      .terminfo         \
	      .vifm             \
	      .w3m              \
	      .wine             \

# configfiles {{{2
CONFIGFILES  = \
	      .apparixrc              \
	      .fehrc                  \
	      .nload                  \
	      batterylog.txt          \
	      boottimelog.txt         \
	      geektool-diskspace.glet \
	      geektool-mail.glet      \
	      geektool-weather.glet   \
	      TODO                    \
