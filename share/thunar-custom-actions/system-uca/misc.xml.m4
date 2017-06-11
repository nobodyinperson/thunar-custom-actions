<?xml version="1.0" encoding="UTF-8"?>
<!-- 
Misc useful custom actions
include(tuca.m4)dnl
-->
<actions>
<action>
	<icon>emblem-symbolic-link</icon>
	<name xml:lang="de">Verknüpfung erstellen</name>
	<name xml:lang="en">Create link to this file</name>
	<command>TUCA_INIT();TITLE="$(eval_gettext 'Select link location')";TARGET="$(TUCA_ZENITY() --file-selection --title="$TITLE" --save --filename TUCA_FIRST_FILE())" || exit;ln -s TUCA_FIRST_FILE() "$TARGET" || TUCA_ZENITY() --error;</command>
	<description xml:lang="de">Eine symbolische Verknüpfung zu der  ausgewählten Datei erstellen.</description>
	<description xml:lang="en">Create a symbolic link to the  selected file.</description>
	<patterns>*</patterns>
	<audio-files/>
	<image-files/>
	<other-files/>
	<text-files/>
	<video-files/>
</action>
<action>
	<icon>edit-find</icon>
	<name xml:lang="de">Platzfresser finden</name>
	<name xml:lang="en">Find space-consuming elements</name>
	<command>TUCA_INIT();TMPFILE=$(mktemp);TUCA_WAIT(du -ha --max-depth 1 TUCA_FIRST_FILE() | grep -v 'TUCA_FIRST_FILE()$' | sort -rh | perl -ne '($s,$n)=m/^(\S+)\s+(\S+.*)$/;$n=~s:.*/([^/]+)$:${1}:g;print "$s\n$n\n"' | tee $TMPFILE,$(eval_gettext 'determining file sizes...'));cd TUCA_FIRST_FILE();cat $TMPFILE | TUCA_ZENITY() --list --column="$(eval_gettext 'size')" --column="$(eval_gettext 'name')" --title="$(eval_gettext 'big elements')" --text="$(eval_gettext 'elements sorted by size')" --print-column 2 | TUCA_XARGS() -r --delimiter='\n' TUCA_XDG_OPEN();rm "$TMPFILE"</command>
	<description xml:lang="de">Die größten Dateien und Ordner hier sortiert auflisten.</description>
	<description xml:lang="en">Give a sorted list of the biggest files and folders here.</description>
	<patterns>*</patterns>
	<directories/>
</action>
</actions>

