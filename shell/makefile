# makefile for ~/.config/shell by luc
# vim: foldmethod=marker

include generic.mk

# variables {{{1
# file lists {{{2
# this is ugly because I need pairs.
CONFIGS = \
	  $(HOME)$(SEP)ctags$(SEP).ctags             \
	  $(HOME)$(SEP)htoprc$(SEP).htoprc           \
	  $(HOME)$(SEP)inputrc$(SEP).inputrc         \
	  $(HOME)$(SEP)latexmkrc$(SEP).latexmkrc     \
	  $(HOME)$(SEP)nload$(SEP).nload             \
	  $(HOME)$(SEP)profile$(SEP).profile         \
	  $(HOME)$(SEP)pystartup$(SEP).pystartup     \
	  $(HOME)$(SEP)rtorrent.rc$(SEP).rtorrent.rc \
	  $(HOME)$(SEP)tmux.conf$(SEP).tmux.conf     \
	  $(HOME)$(SEP)zshenv$(SEP).zshenv           \

OTHER = $(HOME)/$(DIR)$(SEP)zshrc$(SEP).zshrc

# update some remote files {{{1
#update-remote-profiles: update-math-profile update-ifi-profile
#
#update-math-profile: TARGET = math
#update-ifi-profile:  TARGET = ifi
#update-%-profile: git-push
#	@echo ssh $(TARGET) 'cd .config && git pull && make'
#	@ssh $(TARGET)                              \
#	  'cd .config &&                            \
#	  (git pull || git clone $(REMOTEGIT) .) && \
#	  $(MAKE) link-$(TARGET)-profile'
#
#link-math-profile: TARGET = .profile
#link-ifi-profile:  TARGET = .profile_local
#link-%-profile: links
#	cd && $(RM) $(call is_link,$(TARGET))
#	@$(call echo_and_link,shell/remote.profile$(SEP)$(TARGET))
#
#diff-remote-profile:
#	@touch $(TEMPFILE)
#	scp -q math:.profile $(TEMPFILE)
#	-diff $(TEMPFILE) shell/remote.profile
#	@echo > $(TEMPFILE)
#	scp -q ifi:.profile_local $(TEMPFILE)
#	-diff $(TEMPFILE) shell/remote.profile
#	@echo > $(TEMPFILE)
#	@$(RM) $(TEMPFILE)
