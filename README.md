Hello World
===========

This is a minimalist setup for compiling some Unix
classics implemented in Oberon-7. It includes a
Makefile where the expected Oberon-7 compiler is 
OBNC.

Makefile
--------

This make file features the usualy `make`, `make test`, `make install`
and `make uninstall` options. The default installation prefix 
is `/usr/local` but your can provide this via the the option
`prefix=NEW_LOCATION` where NEW_LOCATION is the prefix path
you want.


```
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
	for FNAME in $(PROG_NAMES); do if [ -f $$FNAME ]; then rm $$FNAME; fi; done

install: $(PROG_NAMES)
	@if [ ! -d $(prefix)/bin ]; then mkdir -p $(prefix)/bin; fi
	@for FNAME in $(PROG_NAMES); do cp $$FNAME $(prefix)/bin/; done

uninstall: .FORCE
	@for FNAME in $(PROG_NAMES); do if [ -f "$(prefix)/bin/$$FNAME" ]; then rm "$(prefix)/bin/$$FNAME"; fi; done

.FORCE:
```

Build, Test, Install and uninstall
----------------------------------

The example installs to your home directory using "prefix=".

```
make
make test
make clean
make install prefix=$HOME
make uninstal prefix=$HOME
```

