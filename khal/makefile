CONFIG = ~/.config
SHARE = ~/.local/share/khal
CONFIGFILE = $(CONFIG)/khal/khal.conf
DATABASE = $(SHARE)/khal.db
CALENDARS = $(shell find $(shell configobj-get.py --expanduser 'calendars.*.path' khal.conf))
TODAY = ~/.cache/khal/today
IMAGE = ~/.cache/khal/calendar
VDIRSYNC = $(CONFIG)/vdirsyncer/.run

display:
	@#set -x;\
	if [ $(IMAGE) -nt $(TODAY) ]; then \
	  cat $(IMAGE);                       \
	else                                  \
	  $(MAKE) --quiet display-nocolor;    \
	  $(MAKE) --quiet cache &>/dev/null & \
	fi
display-nocolor: $(CONFIGFILE).nocolor
	khal -c $(CONFIGFILE).nocolor
cache: $(IMAGE)
database: $(DATABASE)
clean:
	$(RM) $(DATABASE) $(IMAGE) $(TODAY) $(VDIRSYNC)

#
$(VDIRSYNC):
	$(MAKE) -C $(dir $(VDIRSYNC)) $(notdir $(VDIRSYNC))

$(CONFIGFILE).nocolor: $(CONFIGFILE)
	sed /highlight_event_days/d < $< > $@

# The database has to be remade when the configuration or the calendars
# change.
$(DATABASE) $(IMAGE): $(CONFIGFILE) $(CALENDARS) $(VDIRSYNC)
	$(RM) $@
	khal --color > $(IMAGE) 2> /dev/null

# The cache image has to be remage every day.
$(IMAGE): $(DATABASE) $(TODAY)
$(TODAY):
	touch --date 'today 00:00' $@

ls:
	@ls -l $(IMAGE) $(TODAY) $(CONFIGFILE) $(VDIRSYNC) $(DATABASE) $(WORK)

.PHONY: database cache # $(TODAY)
makefile:
	set -x;touch --date 'today 00:00' $(TODAY)
