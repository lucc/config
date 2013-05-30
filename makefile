# makefile to create and remove links from $HOME to the dotfile directory
# vim: foldmethod=marker

# functions {{{1
map            = $(foreach a,$(2),$(call $(1),$(a)))
tail           = $(lastword $(subst $(SEP), ,$(1)))
head           = $(firstword $(subst $(SEP), ,$(1)))
is_link        = $(shell cd && if [ -L $(1) ]; then echo $(1); fi)
link           = $(LN) $(DIR)/$(subst $(SEP), ,$(1))
echo_and_link  = echo $(call link,$(1)); cd && $(call link,$(1));
#same_file      = $(shell test $(1) -ef $(2))
#swap           = $(call tail,$(1))$(SEP)$(call head,$(1))
#create_deps = $(eval $(call map,swap,$(subst $(SEP),$(SEP)$(HOME)/,$(CONFIGS))))

# variables {{{1
# general {{{2
SEP         = :
DIR         = $(strip $(subst $(HOME)/, , $(realpath $(dir $(MAKEFILE_LIST)))))
LN          = ln -s
REMOTEGIT   = https://github.com/lucc/config.git
LIMA        = ftp.lima-city.de
TEMPFILE   := $(shell mktemp -t configs-bk.XXXXX)
DATE       := $(shell date +%F)
MKTEMPFILE  = echo put $(file) $(notdir $(file)) >> $(TEMPFILE)
# file lists {{{2
# this is ugly because I need pairs.
CONFIGS     = \
	      abcde.conf$(SEP).abcde.conf           \
	      antiword$(SEP).antiword               \
	      ctags$(SEP).ctags                     \
	      elinks$(SEP).elinks                   \
	      emacs.d$(SEP).emacs.d                 \
	      htoprc$(SEP).htoprc                   \
	      latexmkrc$(SEP).latexmkrc             \
	      mailcap$(SEP).mailcap                 \
	      mailcheckrc$(SEP).mailcheckrc         \
	      mime.types$(SEP).mime.types           \
	      mpd$(SEP).mpd                         \
	      inputrc$(SEP).inputrc                 \
	      mutt$(SEP).mutt                       \
	      pentadactyl$(SEP).pentadactyl         \
	      pentadactylrc$(SEP).pentadactylrc     \
	      gitconfig$(SEP).gitconfig             \
	      pystartup$(SEP).pystartup             \
	      rtorrent.rc$(SEP).rtorrent.rc         \
	      fetchmailrc$(SEP).fetchmailrc         \
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

#CONFIGS_ = $(patsubst %,$(DIR)/%,$(CONFIGS))

UNUSED      = \
              conkyrc$(SEP).conkyrc \
              pal$(SEP).pal         \

# limafiles {{{3
LIMAFILES    = \
	      shell/aliases  \
	      shell/envrc    \
	      vim/gvimrc     \
	      htoprc         \
	      inputrc        \
	      latexmkrc      \
	      profile        \
	      rtorrent.rc    \
	      vim/vimpagerrc \
	      vim/vimrc      \
	      shell/zshenv   \
	      shell/zshrc    \

# linking files to $HOME {{{1
#echo:
#	@echo $(CONFIGS_)
#	@echo $(call map,swap,$(CONFIGS_))

#$(call create_deps)
#$(foreach pair,$(CONFIGS),$(lastword $(subst $(SEP), ,$(pair)))):
#	(LN)



links: clean
	@$(foreach pair,$(CONFIGS) $(SECURE),$(call echoandlink,$(pair)))
clean:
	cd && $(RM) $(call map,islink,$(call map,tail,$(CONFIGS)))
other:
	$(RM) $(HOME)/$(DIR)/mutt/profiles/all
	$(LN) $(HOME)/$(DIR)/secure/mutt-profiles $(HOME)/$(DIR)/mutt/profiles/all

# update git repo {{{1
update:
	git submodule update --recursive
init:
	git submodule update --recursive --init
git-push:
	git push github master


# update some remote files {{{1
update-remote-profiles: update-math-profile update-ifi-profile

update-math-profile: TARGET = math
update-ifi-profile:  TARGET = ifi
update-math-profile update-ifi-profile: git-push
	ssh $(TARGET) \
	  'cd .config && \
	  (git pull || git clone $(REMOTEGIT) .) && \
	  $(MAKE) link-$(TARGET)-profile'

link-math-profile: TARGET = .profile
link-ifi-profile:  TARGET = .profile_local
link-%-profile:
	cd && $(RM) $(call islink,$(TARGET))
	@$(call echoandlink,shell/remote.profile$(SEP)$(TARGET))

diff-remote-profile:
	@touch $(TEMPFILE)
	scp -q math:.profile $(TEMPFILE)
	-diff $(TEMPFILE) shell/remote.profile
	@echo > $(TEMPFILE)
	scp -q ifi:.profile_local $(TEMPFILE)
	-diff $(TEMPFILE) shell/remote.profile
	@echo > $(TEMPFILE)
	@$(RM) $(TEMPFILE)
	
# push files to ftp server {{{1
lima:
	@touch $(TEMPFILE)
	@echo mkdir files/dotfiles/$(DATE) > $(TEMPFILE)
	@echo cd files/dotfiles/$(DATE)   >> $(TEMPFILE)
	@$(foreach file,$(LIMAFILES),$(MKTEMPFILE);)
	@#echo mput $(LIMAFILES)           >> $(TEMPFILE)
	@echo bye                         >> $(TEMPFILE)
	cd ~/.config && ftp -Vi $(LIMA)    < $(TEMPFILE)
	@echo > $(TEMPFILE)
	@$(RM) $(TEMPFILE)

# from the backup.make file {{{1
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
