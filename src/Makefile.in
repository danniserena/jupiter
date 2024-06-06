# @configure_input@

# Package-specific substitution variables
package = @PACKAGE_NAME@
version = @PACKAGE_VERSION@
tarname = @PACKAGE_TARNAME@
distdir = $(tarname)-$(version)

# Prefix-specific substitution variables
prefix = @prefix@
exec_prefix = @exec_prefix@
bindir = @bindir@

# VPATH-related substitution variables
srcdir = @srcdir@
VPATH = @srcdir@

all: jupiter

jupiter: main.c
	gcc -g -O0 -o $@ main.c

check: all
	./jupiter | grep "Hello from .*jupiter!"
	@echo "*** ALL TESTS PASSED ***"

Makefile: Makefile.in ../config.status
	cd .. && ./config.status src/$@

../config.status: ../configure
	cd .. && ./config.status --recheck

install:
	install -d $(bindir)
	install -m 0755 jupiter $(bindir)

uninstall:
	-rm $(bindir)/jupiter

clean:
	-rm jupiter

.PHONY: all clean check install uninstall
