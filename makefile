# makefile to create and remove links from $HOME to the dotfile directory
# vim: foldmethod=marker

# include the generic makefile
include generic.mk

.DEFAULT_GOAL = link-all

# variables {{{1
REMOTEGIT   = https://github.com/lucc/config.git
LIMA        = ftp.lima-city.de
TEMPFILE   := $(shell mktemp -t configs-bk.XXXXX)
DATE       := $(shell date +%F)
MKTEMPFILE  = echo put $(file) $(notdir $(file)) >> $(TEMPFILE)
# file lists {{{2
SUBDIRS = \
	  mac-osx     \
	  mail        \
	  mime        \
	  music       \
	  pentadactyl \
	  secure      \
	  shell       \
	  vim         \

CONFIGS = \
          antiword$(SEP).antiword   \
          elinks$(SEP).elinks       \
          emacs.d$(SEP).emacs.d     \
          gitconfig$(SEP).gitconfig \

# limafiles {{{3
LIMAFILES = \
	    shell/aliases     \
	    shell/envrc       \
	    shell/htoprc      \
	    shell/inputrc     \
	    shell/latexmkrc   \
	    shell/profile     \
	    shell/rtorrent.rc \
	    shell/zshenv      \
	    shell/zshrc       \
	    vim/gvimrc        \
	    vim/vimpagerrc    \
	    vim/vimrc         \

echo-all:echo; @$(foreach d,$(SUBDIRS),$(MAKE) -C $(d) echo;)
link-all: links
	$(foreach d,$(SUBDIRS),$(MAKE) -C $(d) links;)
clean-all: clean
	$(foreach d,$(SUBDIRS),$(MAKE) -C $(d) clean;)

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
CONFIGDIRS = \
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
CONFIGFILES = \
	     .apparixrc \
	     .fehrc     \
	     .nload     \
