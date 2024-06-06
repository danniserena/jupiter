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

# VPATH-specific substitution variables
srcdir = @srcdir@
VPATH = @srcdir@

all clean check install uninstall jupiter:
	cd  src && $(MAKE) $@

dist: $(distdir).tar.gz
$(distdir).tar.gz: $(distdir)
	tar chof - $(distdir) | gzip -9 -c > $@
	rm -rf $(distdir)

$(distdir): force
	mkdir -p $(distdir)/src
	cp $(srcdir)/configure.ac $(distdir)
	cp $(srcdir)/configure $(distdir)
	cp $(srcdir)/Makefile.in $(distdir)
	cp $(srcdir)/src/Makefile.in $(distdir)/src
	cp $(srcdir)/src/main.c $(distdir)/src

distcheck: $(distdir).tar.gz
	gzip -cd $(distdir).tar.gz | tar xvf -
	cd $(distdir) && ./configure
	cd $(distdir) && $(MAKE) all
	cd $(distdir) && $(MAKE) check
	cd $(distdir) && $(MAKE) prefix=$${PWD}/_inst install
	cd $(distdir) && $(MAKE) prefix=$${PWD}/_inst uninstall
	@remaining="`find $${PWD}/$(distdir)/_inst -type f | wc -l`"; \
 	if test "$${remaining}" -ne 0; then \
	  echo "*** $${remaining} file(s) remaining in stage directory!"; \
	  exit 1; \
	fi
	cd $(distdir) && $(MAKE) clean
	rm -rf $(distdir)

Makefile: Makefile.in config.status
	./config.status $@

config.status: configure
	./config.status --recheck

.PHONY: all clean check dist distcheck force install uninstall
