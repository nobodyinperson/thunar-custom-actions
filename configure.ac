#                                               -*- Autoconf -*-
# Process this file with autoconf to produce a configure script.

AC_PREREQ([2.69])
AC_INIT([thunar-custom-actions], [0.0.1], [nobodyinperson@gmx.de])

m4_include([m4/ax_python_module.m4])

# Checks for programs.
AC_CHECK_PROG([pandoc_bin],[pandoc],[yes],[no])
test "$pandoc_bin" != "yes" && AC_MSG_ERROR([no pandoc installation found])

# Check for Python modules
AX_PYTHON_MODULE(lxml,fatal,python3)


AC_CONFIG_FILES([Makefile])
AC_OUTPUT
