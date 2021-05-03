#
# Simple Makefile for compiling Oberon-7 programs using OBNC.
# Set the list of executable PROG_NAMES and assuming all modules
# are in the same directory then the rest should just work as is.
#
PROG_NAMES = HelloWorld HelloFriend HiFibo
MODULES = $(shell ls *.Mod)
OC = obnc

all: $(PROG_NAMES)

$(PROG_NAMES): $(MODULES)
	obnc -o $@ $@.Mod

clean: .FORCE
	@if [ -d .obnc ]; then rm -fR .obnc; fi
	@for FNAME in $(PROG_NAMES); do if [ -f $$FNAME ]; then rm $$FNAME; fi; done

.FORCE:
