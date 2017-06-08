define(TUCA_FILE_VAR,file)dnl
define(TUCA_TEMP_VAR,filetmp)dnl
define(TUCA_OUT_VAR,fileout)dnl
define(TUCA_FILE,"$TUCA_FILE_VAR")dnl
define(TUCA_TEMP,"$TUCA_TEMP_VAR")dnl
define(TUCA_OUT,"$TUCA_OUT_VAR")dnl
dnl
define(TUCA_ALL_FILES,%F)dnl
define(TUCA_ALL_FILE_FOLDERS,%D)dnl
define(TUCA_ALL_FILENAMES,%N)dnl
dnl
define(TUCA_FIRST_FILE,%f)dnl
define(TUCA_FIRST_FILE_FOLDER,%d)dnl
define(TUCA_FIRST_FILENAME,%n)dnl
dnl
define(TUCA_LOOP,dnl
AMOUNT=$(for TUCA_FILE_VAR in TUCA_ALL_FILES;do echo TUCA_FILE;done | wc -l);dnl
NR=0;dnl
for TUCA_FILE_VAR in TUCA_ALL_FILES;do dnl
 NR=$(echo "$NR+1" | bc);dnl
 echo "`#'"$(basename TUCA_FILE);dnl
 echo $(echo "$NR*100/$AMOUNT" | bc);dnl
 TUCA_TEMP_VAR=$(dirname TUCA_FILE)/.$(basename TUCA_FILE).tmp;dnl
 $1 2>/dev/null >/dev/null;dnl
 if test -z TUCA_OUT;then TUCA_OUT_VAR=TUCA_FILE;fi;dnl
 cp TUCA_TEMP TUCA_OUT;dnl
 rm TUCA_TEMP;dnl
 unset TUCA_OUT_VAR;dnl
done |dnl
zenity --progress --auto-kill --auto-close;dnl
)dnl
dnl
define(TUCA_WAIT,dnl
set -e;dnl
$1 |dnl
zenity --progress --auto-kill --auto-close --pulsate dnl
)dnl
