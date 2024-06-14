#                                               -*- Autoconf -*-
# Process this file with autoconf to produce a configure script.

AC_PREREQ([2.65])
AC_INIT([Jupiter], [1.0], [Jupiter-bugs@example.org])
AM_INIT_AUTOMAKE
LT_PREREQ([2.2])
LT_INIT([dlopen])
AC_CONFIG_SRCDIR([src/main.c])
AC_CONFIG_HEADERS([config.h])

# Checks for programs.
AC_PROG_CC
AM_PROG_CC_C_O
# AC_PROG_RANLIB
# _DEBUG_START_
AC_CHECK_PROG([make_var], [make], [yes], [no],,[/etc/alternatives/make])
# _DEBUG_END_
AC_PROG_INSTALL

# Checks for libraries.
have_pthreads=no
AC_SEARCH_LIBS([pthread_create], [pthread], [have_pthreads=yes])

# Checks for header files.
AC_CHECK_HEADERS([stdlib.h pthread.h])
if test "x${have_pthreads}" = xyes; then
 AC_CHECK_HEADERS([pthread.h], [], [have_pthreads=no])
fi
if test "x${have_pthreads}" = xno; then
 AC_MSG_WARN([
 ------------------------------------------
 Unable to find pthreads on this system.
 Building a single-threaded version.
 ------------------------------------------])
fi

# Checks for typedefs, structures, and compiler characteristics.

# Checks for library functions.
# The sequence is important
AC_CONFIG_FILES([Makefile
                 common/Makefile
                 include/Makefile
                 libjup/Makefile
                 src/Makefile
                 ])
AC_OUTPUT
