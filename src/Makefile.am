bin_PROGRAMS = jupiter
jupiter_SOURCES = main.c

# Check_SCRIPTS = greptest.sh
# TESTS = $(Check_SCRIPTS)
#
# greptest.sh:
# 	echo './jupiter | grep "Hello from .*jupiter!" > greptest.sh
# 	chmod +x greptest.sj
#

jupiter_CPPFLAGS = -I$(top_srcdir)/common
jupiter_LDADD = ../common/libjupcommon.a

CLEANFILES = greptest.sh
