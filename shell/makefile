# makefile for ~/.config/shell by luc
# vim: foldmethod=marker

include generic.mk

# variables {{{1
CONFIGS = \
	  ctags$(SEP).ctags             \
	  htoprc$(SEP).htoprc           \
	  inputrc$(SEP).inputrc         \
	  latexmkrc$(SEP).latexmkrc     \
	  nload$(SEP).nload             \
	  profile$(SEP).profile         \
	  pystartup$(SEP).pystartup     \
	  rtorrent.rc$(SEP).rtorrent.rc \
	  tmux.conf$(SEP).tmux.conf     \
	  zshenv$(SEP).zshenv           \

OTHER = $(HOME)/$(DIR)$(SEP)zshrc$(SEP).zshrc

# update some remote files {{{1
update-remote-profiles: update-math-profile update-ifi-profile

update-math-profile: TARGET = math
update-ifi-profile:  TARGET = ifi
update-math-profile update-ifi-profile: git-push
	@echo ssh $(TARGET) 'cd .config && git pull && make'
	@ssh $(TARGET)                              \
	  'cd .config &&                            \
	  (git pull || git clone $(REMOTEGIT) .) && \
	  $(MAKE) link-$(TARGET)-profile'

link-math-profile: TARGET = .profile
link-ifi-profile:  TARGET = .profile_local
link-%-profile:    CONFIGS += remote.profile$(SEP)$(TARGET)
link-math-profile link-ifi-profile: links

#diff-remote-profile:
#	@touch $(TEMPFILE)
#	scp -q math:.profile $(TEMPFILE)
#	-diff $(TEMPFILE) shell/remote.profile
#	@echo > $(TEMPFILE)
#	scp -q ifi:.profile_local $(TEMPFILE)
#	-diff $(TEMPFILE) shell/remote.profile
#	@echo > $(TEMPFILE)
#	@$(RM) $(TEMPFILE)

.PHONY: update-remote-profiles update-math-profile update-ifi-profile link-math-profile link-ifi-profile
