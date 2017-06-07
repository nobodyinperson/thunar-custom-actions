<?xml version="1.0" encoding="UTF-8"?>
<!-- 
PDF manipulation Thunar custom actions
include(tuca.m4)dnl
-->
<actions>
<action>
	<icon>application-pdf</icon>
	<name>convert to PDF</name>
	<name xml:lang="de">zu PDF konvertieren</name>
	<name xml:lang="en">convert to PDF</name>
	<command>TUCA_WAIT(convert TUCA_ALL_FILES -gravity Center -background white -resize 1654x2338 -extent 1654x2338 -units PixelsPerInch -density 200x200 TUCA_FIRST_FILE.pdf)</command>
    <description>The selected images are converted to pages of a single PDF document at A4 page size.</description>
    <description xml:lang="de">Die ausgewählten Bilder werden zu Seiten eines einzigen PDF-Dokument in A4-Größe konvertiert.</description>
    <description xml:lang="en">The selected images are converted to pages of a single PDF document at A4 page size.</description>
	<patterns>*</patterns>
	<image-files/>
</action>
</actions>

