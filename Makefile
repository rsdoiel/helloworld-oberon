#
# Simple Makefile for compiling Oberon-7 programs using OBNC.
# Set the list of executables in PROG_NAMES. The rest can probably
# stay as is if all modules are in the same directory. 
#
PROG_NAMES = HelloWorld HelloFriend HiFibo
MODULES = $(shell ls *.Mod)
OC = obnc

prefix =
ifeq ($(prefix), )
	prefix = /usr/local
endif

all: $(PROG_NAMES)

$(PROG_NAMES): $(MODULES)
	$(OC) -o $@ $@.Mod

test: $(PROG_NAMES)
	@for FNAME in $(PROG_NAMES); do ./$$FNAME; done

clean: .FORCE
	@if [ -d .obnc ]; then rm -fR .obnc; fi
	@for FNAME in $(PROG_NAMES); do if [ -f $$FNAME ]; then rm $$FNAME; fi; done

install: $(PROG_NAMES)
	@if [ ! -d $(prefix)/bin ]; then mkdir -p $(prefix)/bin; fi
	@for FNAME in $(PROG_NAMES); do cp $$FNAME $(prefix)/bin/; done

uninstall: .FORCE
	@for FNAME in $(PROG_NAMES); do if [ -f "$(prefix)/bin/$$FNAME" ]; then rm "$(prefix)/bin/$$FNAME"; fi; done

.FORCE:
