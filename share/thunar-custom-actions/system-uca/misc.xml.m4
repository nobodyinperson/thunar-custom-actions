<?xml version="1.0" encoding="UTF-8"?>
<!-- 
Misc useful custom actions
include(tuca.m4)dnl
-->
<actions>
<action>
	<icon>emblem-symbolic-link</icon>
	<name xml:lang="de">Verknüpfung erstellen</name>
	<name xml:lang="en">Create link targeted here</name>
	<command>TUCA_CMD(dnl
        TARGET="$(TUCA_ZENITY() --file-selection --title="TUCA_TRANSLATE(Select link location)" --save --filename TUCA_FIRST_FILE())" || exit;dnl
        if test "$TARGET" = TUCA_FIRST_FILE();then dnl
        TUCA_ERROR(TUCA_TRANSLATE(The link name has to differ from the target name.));exit;dnl
        fi;dnl
        TUCA_CREATE_FILE(dnl
            ln -sf TUCA_IN() TUCA_OUT() || TUCA_ERROR(TUCA_TRANSLATE(Could not create link)),dnl command
            TUCA_FIRST_FILE(),dnl input
            $TARGET,dnl output
           notmpfile,dnl no tempfile needed
            )dnl
        )</command>
	<description xml:lang="de">Eine symbolische Verknüpfung hierher erstellen.</description>
	<description xml:lang="en">Create a symbolic link targeted here.</description>
	<patterns>*</patterns>
	<audio-files/>
	<image-files/>
	<other-files/>
	<text-files/>
	<video-files/>
	<directories/>
</action>
<action>
	<icon>edit-find</icon>
	<name xml:lang="de">Platzfresser finden</name>
	<name xml:lang="en">Find space-consuming elements</name>
	<command>TUCA_CMD(dnl
    TMPFILE=$(mktemp);dnl
    TUCA_PROGRESSBAR(dnl
        TUCA_PROGRESSBAR_TEXT(TUCA_TRANSLATE(Determining file sizes)...);dnl
        du -ha --max-depth 1 TUCA_FIRST_FILE() | dnl
            grep -v 'TUCA_FIRST_FILE()$' | dnl
            sort -rh | dnl
            perl -ne '($s,$n)=m/^(\S+)\s+(\S+.*)$/;$n=~s:.*/([^/]+)$:${1}:g;print "$s\n$n\n"' | dnl
            tee $TMPFILE, dnl
        TUCA_TRANSLATE(Determining file sizes),dnl title
        pulse);dnl let the progressbar just pulse
    cd TUCA_FIRST_FILE();dnl
    cat $TMPFILE | dnl
        TUCA_ZENITY() --list --column="TUCA_TRANSLATE(Size)" dnl
            --column="TUCA_TRANSLATE(Name)" dnl
            --title="TUCA_TRANSLATE(Big elements)" dnl
            --text="TUCA_TRANSLATE(Elements sorted by size)\n<~~>TUCA_TRANSLATE(Double-click to open.)" dnl
            --print-column 2 | dnl
        TUCA_XARGS() -r --delimiter='\n' TUCA_XDG_OPEN();dnl
    rm "$TMPFILE")</command>
	<description xml:lang="de">Die größten Dateien und Ordner hier sortiert auflisten.</description>
	<description xml:lang="en">Give a sorted list of the biggest files and folders here.</description>
	<patterns>*</patterns>
	<directories/>
</action>
<action>
	<icon>checkbox-checked-symbolic</icon>
	<name xml:lang="de">Prüfsummen</name>
	<name xml:lang="en">Checksums</name>
	<command>TUCA_CMD(dnl
    TMPFILE=$(mktemp);dnl
    TUCA_PROGRESSBAR(dnl
        TUCA_LOOP(dnl
            basename TUCA_FILE() >> $TMPFILE;dnl
            TUCA_MD5SUM()    TUCA_FILE() | cut -d' ' -f1 >> $TMPFILE;dnl
            TUCA_SHA1SUM()   TUCA_FILE() | cut -d' ' -f1 >> $TMPFILE;dnl
            TUCA_SHA256SUM() TUCA_FILE() | cut -d' ' -f1 >> $TMPFILE;dnl
            ,dnl command
            TUCA_TRANSLATE(Determining checksums),dnl loop description
            ),dnl
        TUCA_TRANSLATE(Determining checksums),dnl title
        );dnl 
    cat $TMPFILE | dnl
        TUCA_ZENITY() --list dnl
            --column="TUCA_TRANSLATE(Name)" dnl
            --column="TUCA_TRANSLATE(MD5)" dnl
            --column="TUCA_TRANSLATE(SHA1)" dnl
            --column="TUCA_TRANSLATE(SHA256)" dnl
            --title="TUCA_TRANSLATE(Checksums)" dnl
            --text="TUCA_TRANSLATE(Checksums)\n<~~>TUCA_TRANSLATE(Double-click to open.)" dnl
            --print-column 1 | dnl
        TUCA_XARGS() -r --delimiter='\n' TUCA_XDG_OPEN();dnl
    rm "$TMPFILE")</command>
	<description xml:lang="de">Verschiedene Prüfsummen der ausgewählten Dateien anzeigen.</description>
	<description xml:lang="en">Show different checksums of the selected files.</description>
	<patterns>*</patterns>
	<audio-files/>
	<image-files/>
	<other-files/>
	<text-files/>
	<video-files/>
</action>
</actions>

