#                                               -*- Autoconf -*-
# Process this file with autoconf to produce a configure script.

AC_PREREQ([2.69])
AC_INIT([thunar-custom-actions], [0.0.3], [nobodyinperson@gmx.de])

m4_include([m4/ax_python_module.m4])

AC_ARG_VAR([PASSWDFILE],[path to passwd file [SYSCONFDIR/passwd]]) 
AC_SUBST([PASSWDFILE])
AC_ARG_VAR([UCAFILE],[relative path from homedir to Thunar uca.xml file
[.config/Thunar/uca.xml]]) 
AC_SUBST([UCAFILE])

# Checks for programs.
AC_CHECK_PROG([make_bin],[make],[yes],[no])
test "$make_bin" != "yes" && AC_MSG_ERROR([no make found])

AC_CHECK_PROG([convert_bin],[convert],[yes],[no])
test "$convert_bin" != "yes" && AC_MSG_ERROR([no convert/ImageMagick found])

AC_CHECK_PROG([m4_bin],[m4],[yes],[no])
test "$m4_bin" != "yes" && AC_MSG_ERROR([no m4 found])

AC_CHECK_PROG([pandoc_bin],[pandoc],[yes],[no])
test "$pandoc_bin" != "yes" && AC_MSG_ERROR([no pandoc installation found])

# Checks for programs.
AC_CHECK_PROG([python3_bin],[python3],[yes],[no])
test "$python3_bin" != "yes" && AC_MSG_ERROR([no python3 installation found])

# Check for Python modules
AX_PYTHON_MODULE(lxml,fatal,python3)


AC_CONFIG_FILES([Makefile bin/uca-apply])
AC_OUTPUT
