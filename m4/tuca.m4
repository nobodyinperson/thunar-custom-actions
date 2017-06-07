define(TUCA_FILE,file)dnl
define(TUCA_TEMP,filetmp)dnl
dnl
define(TUCA_ALL_FILES,%F)dnl
define(TUCA_ALL_FILE_FOLDERS,%D)dnl
define(TUCA_ALL_FILENAMES,%N)dnl
dnl
define(TUCA_FIRST_FILE,%f)dnl
define(TUCA_FIRST_FILE_FOLDER,%d)dnl
define(TUCA_FIRST_FILENAME,%n)dnl
dnl
dnl
define(TUCA_LOOP,dnl
set -e;dnl
AMOUNT=$(for TUCA_FILE in TUCA_ALL_FILES;do echo $TUCA_FILE;done | wc -l);dnl
NR=0;dnl
for TUCA_FILE in TUCA_ALL_FILES;do dnl
 NR=$(echo "$NR+1" | bc);dnl
 echo "`#'"$(basename "$TUCA_FILE");dnl
 echo $(echo "$NR*100/$AMOUNT" | bc);dnl
 TUCA_TEMP=$(dirname "$TUCA_FILE")/.$(basename "$TUCA_FILE").tmp;dnl
 $1 2>/dev/null >/dev/null;dnl
 cp "$TUCA_TEMP" "$TUCA_FILE";dnl
 rm "$TUCA_TEMP";dnl
done |dnl
zenity --progress --auto-kill --auto-close;dnl
)dnl
dnl
define(TUCA_WAIT,dnl
set -e;dnl
$1 |dnl
zenity --progress --auto-kill --auto-close --pulsate;dnl
)dnl
