SUBDIRS = modules/hithere

bin_PROGRAMS = jupiter
jupiter_SOURCES = main.c module.h

Check_SCRIPTS = greptest.sh
TESTS = $(Check_SCRIPTS)
# 定义测试目录
Checkdir = $(abs_top_builddir)/check

greptest.sh:
	echo './jupiter | grep ".* from .*jupiter!"' > greptest.sh
	chmod +x greptest.sh


jupiter_CPPFLAGS = -I$(top_srcdir)/include
jupiter_LDADD = ../libjup/libjupiter.la -dlopen modules/hithere/hithere.la

CLEANFILES = greptest.sh
