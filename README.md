Hello World
===========

This is a minimalist setup for compiling some Unix
classics implemented in Oberon-7. It includes a
Makefile where the expected Oberon-7 compiler is 
OBNC.

Simple Makefile
---------------

```
#
# Simple Makefile for compiling Oberon-7 programs using OBNC.
# Set the list of executables in PROG_NAMES. The rest can probably
# stay as is if all modules are in the same directory. 
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
```

Test
----

```
make
./HelloWorld
./HelloFriend
./HiFibo
make clean
```

