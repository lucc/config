# makefile for ~/.config/mac-osx by luc

# include the generic makefile
include ../generic.mk

links: ; ln -f com.googlecode.iterm2.plist ~/Library/Preferences
	cd ~/Library && ln -s $(DIR)/calendar Calendar
	cd ~/Library/Application\ Support/ && ln -s $(DIR)/addressbook AddressBook
.DEFAULT_GOAL = links
