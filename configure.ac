#                                               -*- Autoconf -*-
# Process this file with autoconf to produce a configure script.

AC_PREREQ([2.69])
AC_INIT([thunar-custom-actions], [0.0.19], [nobodyinperson@gmx.de])

m4_include([m4/ax_python_module.m4])
m4_include([m4/m4-utils/autoconf/nb_require_prog.m4])
m4_include([m4/m4-utils/autoconf/nb_create_makefile_include.m4])

AC_ARG_VAR([PASSWDFILE],[path to passwd file [SYSCONFDIR/passwd]]) 
AC_SUBST([PASSWDFILE])
AC_ARG_VAR([UCAFILE],[relative path from homedir to Thunar uca.xml file
[.config/Thunar/uca.xml]]) 
AC_SUBST([UCAFILE])

# # Checks for programs.
NB_REQUIRE_PROG([make],[make_bin],[program])
NB_REQUIRE_PROG([xdg-open],[xdg_open_bin],[program])
NB_REQUIRE_PROG([convert],[convert_bin],[imagemagick])
NB_REQUIRE_PROG([su],[su_bin],[program])
NB_REQUIRE_PROG([xargs],[xargs_bin],[program])
NB_REQUIRE_PROG([find],[find_bin],[program])
NB_REQUIRE_PROG([perl],[perl_bin],[program])
NB_REQUIRE_PROG([gpg2],[gpg2_bin],[gnupg])
NB_REQUIRE_PROG([zenity],[zenity_bin],[program])
NB_REQUIRE_PROG([bc],[bc_bin],[program])
NB_REQUIRE_PROG([gs],[gs_bin],[ghostscript])
NB_REQUIRE_PROG([m4],[m4_bin],[m4sugar])
NB_REQUIRE_PROG([pandoc],[pandoc_bin],[program])
NB_REQUIRE_PROG([python3],[python3_bin],[program])
NB_REQUIRE_PROG([gettext],[gettext_bin],[localisation program])
NB_REQUIRE_PROG([gettext.sh],[gettextsh_bin],[gettext for shell])
NB_REQUIRE_PROG([xgettext],[xgettext_bin],[program])
NB_REQUIRE_PROG([msgfmt],[msgfmt_bin],[program])
NB_REQUIRE_PROG([msgmerge],[msgmerge_bin],[program])
NB_REQUIRE_PROG([md5sum],[md5sum_bin],[program])
NB_REQUIRE_PROG([sha1sum],[sha1sum_bin],[program])
NB_REQUIRE_PROG([sha256sum],[sha256sum_bin],[program])
NB_REQUIRE_PROG([pinentry-gtk-2],[pinentry_gtk_2_bin],[graphical password dialog])
NB_REQUIRE_PROG([gpg-agent],[gpg_agent_bin],[gnupg agent])
NB_REQUIRE_PROG([gpg-connect-agent],[gpg_connect_agent_bin],[gnupg agent control])

# Check for Python modules
AX_PYTHON_MODULE(lxml,fatal,python3)

NB_CREATE_MAKEFILE_INCLUDE(
    [configure_vars],
    [makefile_include],
    [include/$PACKAGE_NAME/configure_vars.mk])

AC_CONFIG_FILES([Makefile])
AC_OUTPUT
