# makefile for ~/.config/mac-osx by luc

# include the generic makefile
include ../generic.mk

links: ; ln -f com.googlecode.iterm2.plist ~/Library/Preferences
	cd ~/Library && ln -fs $(HOME)/$(DIR)/calendar Calendars
	cd ~/Library/Application\ Support/ && ln -fs $(HOME)/$(DIR)/addressbook AddressBook
	cd && ln -fs $(DIR)/macosx .MacOSX
.DEFAULT_GOAL = links
