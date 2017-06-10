dnl
changequote(`<~', `~>')dnl
dnl
dnl paths from ./configure
define(<~TUCA_ZENITY~>,<~/usr/bin/zenity~>)dnl
define(<~TUCA_CONVERT~>,<~/usr/bin/convert~>)dnl
define(<~TUCA_MAKE~>,<~/usr/bin/make~>)dnl
define(<~TUCA_XDG_OPEN~>,<~/usr/bin/xdg-open~>)dnl
define(<~TUCA_SU~>,<~/bin/su~>)dnl
define(<~TUCA_XARGS~>,<~/usr/bin/xargs~>)dnl
define(<~TUCA_PERL~>,<~/usr/bin/perl~>)dnl
define(<~TUCA_GPG2~>,<~/usr/bin/gpg2~>)dnl
define(<~TUCA_ZENITY~>,<~/usr/bin/zenity~>)dnl
define(<~TUCA_BC~>,<~/usr/bin/bc~>)dnl
define(<~TUCA_GS~>,<~/usr/bin/gs~>)dnl
define(<~TUCA_M4~>,<~/usr/bin/m4~>)dnl
define(<~TUCA_PANDOC~>,<~/usr/bin/pandoc~>)dnl
define(<~TUCA_PYTHON3~>,<~/usr/bin/python3~>)dnl
dnl
define(<~TUCA_FILE_VAR~>,<~file~>)dnl
define(<~TUCA_TEMP_VAR~>,<~filetmp~>)dnl
define(<~TUCA_OUT_VAR~>,<~fileout~>)dnl
define(<~TUCA_FILE~>,<~"$TUCA_FILE_VAR"~>)dnl
define(<~TUCA_TEMP~>,<~"$TUCA_TEMP_VAR"~>)dnl
define(<~TUCA_OUT~>,<~"$TUCA_OUT_VAR"~>)dnl
dnl
define(<~TUCA_ALL_FILES~>,<~%F~>)dnl
define(<~TUCA_ALL_FILE_FOLDERS~>,<~%D~>)dnl
define(<~TUCA_ALL_FILENAMES~>,<~%N~>)dnl
dnl
define(<~TUCA_FIRST_FILE~>,<~%f~>)dnl
define(<~TUCA_FIRST_FILE_FOLDER~>,<~%d~>)dnl
define(<~TUCA_FIRST_FILENAME~>,<~%n~>)dnl
dnl
dnl TUCA_COLOR_SELECTION([html])
dnl $1 = html returns hex color in HTML-style
define(<~TUCA_COLOR_SELECTION~>,<~dnl
TUCA_ZENITY() --color-selection<~~>dnl
ifelse($1,html,<~| TUCA_PERL() -ne '@tmp=m/\D+(\d+)\D+(\d+)\D+(\d+)/ or @tmp=(255,255,255);printf "<~#~>%%02X%%02X%%02X",@tmp'~>)<~~>dnl
~>)dnl
dnl
define(<~TUCA_LOOP~>,<~dnl
AMOUNT=$(for TUCA_FILE_VAR() in TUCA_ALL_FILES();do echo TUCA_FILE();done | wc -l);dnl
NR=0;dnl
for TUCA_FILE_VAR() in TUCA_ALL_FILES();do dnl
 NR=$(echo "$NR+1" | TUCA_BC());dnl
 echo "<~#~>"$(basename TUCA_FILE());dnl
 TUCA_TEMP_VAR()="$(dirname TUCA_FILE())/.$(basename TUCA_FILE()).tmp";dnl
 dnl echo $1 | logger;dnl
 $1 2>/dev/null >/dev/null;dnl
 if test -z TUCA_OUT();then TUCA_OUT_VAR()=TUCA_FILE();fi;dnl
 cp TUCA_TEMP() TUCA_OUT();dnl
 echo $(echo "$NR*100/$AMOUNT" | TUCA_BC());dnl
 rm TUCA_TEMP();dnl
 unset TUCA_OUT_VAR();dnl
done |dnl
TUCA_ZENITY() --progress --auto-kill --auto-close;dnl
~>)dnl
dnl
define(<~TUCA_WAIT~>,<~dnl
set -e;dnl
$1 |dnl
TUCA_ZENITY() --progress --auto-kill --auto-close --pulsate<~~>dnl
~>)dnl
