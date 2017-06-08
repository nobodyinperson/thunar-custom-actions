<?xml version="1.0" encoding="UTF-8"?>
<!-- 
PDF manipulation Thunar custom actions
include(tuca.m4)dnl
-->
<actions>
<action>
	<icon>application-pdf</icon>
	<name xml:lang="de">zu PDF konvertieren</name>
	<name xml:lang="en">convert to PDF</name>
	<command>TUCA_WAIT(convert TUCA_ALL_FILES -gravity Center -background white -resize 1654x2338 -extent 1654x2338 -units PixelsPerInch -density 200x200 TUCA_FIRST_FILE.pdf)</command>
    <description xml:lang="de">Die ausgewählten Bilder werden zu Seiten eines einzigen PDF-Dokument in A4-Größe konvertiert.</description>
    <description xml:lang="en">The selected images are converted to pages of a single PDF document at A4 page size.</description>
	<patterns>*</patterns>
	<image-files/>
</action>
<action>
	<icon>application-pdf</icon>
	<name xml:lang="de">zu einem PDF zusammenfügen</name>
	<name xml:lang="en">concatenate PDFs</name>
	<command>TUCA_WAIT(gs -dBATCH -dNOPAUSE -q -sDEVICE=pdfwrite -sOutputFile=TUCA_FIRST_FILE-all.pdf TUCA_ALL_FILES)</command>
    <description xml:lang="de">Die ausgewählten PDF-Dateien werden zu einem einzigen PDF-Dokument zusammengefügt</description>
    <description xml:lang="en">The selected PDF files are concatenated into one PDF file.</description>
	<patterns>*.PDF;*.pdf</patterns>
	<other-files/>
</action>
<action>
	<icon>window-restore-symbolic</icon>
	<name xml:lang="de">PDF-Dateigröße verringern</name>
	<name xml:lang="en">reduce PDF file size</name>
	<command>TUCA_LOOP(gs -dBATCH -dNOPAUSE -q -dPDFSETTINGS=/screen -sDEVICE=pdfwrite -dDownsampleColorImages=true -dDownsampleGrayImages=true -dDownsampleMonoImages=true -dColorImageResolution=72 -dGrayImageResolution=72 -dMonoImageResolution=72 -sOutputFile=TUCA_TEMP TUCA_FILE)</command>
    <description xml:lang="de">[Vorsicht: Qualitätsverlust] Es wird versucht, bei den ausgewählten PDF-Dokumenten die Dateigröße zu verringern.</description>
    <description xml:lang="en">[Caution: loss of quality!] An attempt to reduce the file size of each selected PDF file is made.</description>
	<patterns>*.PDF;*.pdf</patterns>
	<other-files/>
</action>
</actions>

