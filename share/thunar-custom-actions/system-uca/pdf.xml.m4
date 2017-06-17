<?xml version="1.0" encoding="UTF-8"?>
<!-- 
PDF manipulation Thunar custom actions
include(tuca.m4)dnl
-->
<actions>
<action>
	<icon>application-pdf</icon>
	<name xml:lang="de">zu einem PDF konvertieren</name>
	<name xml:lang="en">Convert to a single PDF</name>
	<command>TUCA_CMD(dnl
        ORIENTATION="$(dnl
            (dnl
            echo TRUE;dnl
            echo TUCA_TRANSLATE(Portrait);dnl
            echo FALSE;dnl
            echo TUCA_TRANSLATE(Landscape);dnl
            ) | TUCA_ZENITY() --list dnl
            --print-column=2 dnl
            --radiolist dnl
            --column="" dnl
            --column="TUCA_TRANSLATE(Orientation)" dnl
            --text="TUCA_TRANSLATE(Choose an orientation for the PDF.)" dnl
            --title="TUCA_TRANSLATE(PDF orientation)")"; dnl
        if test $? -ne 0;then dnl
            exit;dnl user aborted
        fi;dnl
        A4_PORTRAIT_WIDTH=1654;dnl
        A4_PORTRAIT_HEIGHT=2338;dnl
        if test "$ORIENTATION" = "TUCA_TRANSLATE(Portrait)";then dnl
            WIDTH=$A4_PORTRAIT_WIDTH;dnl
            HEIGHT=$A4_PORTRAIT_HEIGHT;dnl
        elif test "$ORIENTATION" = "TUCA_TRANSLATE(Landscape)";then dnl
            WIDTH=$A4_PORTRAIT_HEIGHT;dnl
            HEIGHT=$A4_PORTRAIT_WIDTH;dnl
        else dnl
            TUCA_ERROR(TUCA_TRANSLATE(Strange orientation $ORIENTATION selected.) TUCA_TRANSLATE(If you see this message<~,~> please contact the developer on https://github.com/nobodyinperson/thunar-custom-actions.));dnl
            exit 1;dnl
        fi; dnl
        TUCA_PROGRESSBAR(dnl
            TUCA_PROGRESSBAR_TEXT(TUCA_TRANSLATE(Converting to PDF)...);dnl
            TUCA_CREATE_FILE(dnl
                dnl Caution: this command does not use TUCA_IN, but
                dnl TUCA_ALL_FILES directly. This is difficult because storing
                dnl multiple filenames with spaces in one variable is tricky
                TUCA_CONVERT() TUCA_ALL_FILES() -gravity Center -background white -resize ${WIDTH}x${HEIGHT} -extent ${WIDTH}x${HEIGHT} -units PixelsPerInch -density 200x200 TUCA_OUT(),dnl
                TUCA_ALL_FILES(),dnl input (actually not used as TUCA_IN)
                $(dirname TUCA_FIRST_FILE())/$(basename TUCA_FIRST_FILE() | TUCA_PERL() -pe 's#\.\w+<~$~>##g')_$ORIENTATION.pdf,dnl output name
                ),dnl
            TUCA_TRANSLATE(Converting to PDF),dnl progressbar title
            pulse,dnl let the progressbar just pulse
            )dnl
        )</command>
    <description xml:lang="de">Die ausgewählten Bilder werden zu Seiten eines einzigen PDF-Dokument in A4-Größe konvertiert.</description>
    <description xml:lang="en">The selected images are converted to pages of a single PDF document at A4 page size.</description>
	<patterns>*</patterns>
	<image-files/>
</action>
<action>
	<icon>application-pdf</icon>
	<name xml:lang="de">zu einem PDF zusammenfügen</name>
	<name xml:lang="en">Concatenate PDFs</name>
	<command>TUCA_CMD(dnl
        TUCA_PROGRESSBAR(dnl
            TUCA_PROGRESSBAR_TEXT(TUCA_TRANSLATE(Concatenating PDFs)...);dnl
            TUCA_CREATE_FILE(dnl
                dnl Caution: this command does not use TUCA_IN, but
                dnl TUCA_ALL_FILES directly. This is difficult because storing
                dnl multiple filenames with spaces in one variable is tricky
                TUCA_GS() -dBATCH -dNOPAUSE -q -sDEVICE=pdfwrite -sOutputFile=TUCA_OUT() TUCA_ALL_FILES(),dnl
                TUCA_ALL_FILES(),dnl input (actually not used as TUCA_IN)
                TUCA_FIRST_FILE()-all.pdf,dnl output file
                ),dnl
            TUCA_TRANSLATE(Concatenating PDFs),dnl progressbar title
            pulse,dnl
            )dnl
        )</command>
    <description xml:lang="de">Die ausgewählten PDF-Dateien werden zu einem einzigen PDF-Dokument zusammengefügt</description>
    <description xml:lang="en">The selected PDF files are concatenated into one PDF file.</description>
	<patterns>*.PDF;*.pdf</patterns>
	<other-files/>
</action>
<action>
	<icon>window-restore-symbolic</icon>
	<name xml:lang="de">PDF-Dateigröße verringern</name>
	<name xml:lang="en">Reduce PDF file size</name>
	<command>TUCA_CMD(dnl
    TUCA_PROGRESSBAR(dnl
        TUCA_LOOP(dnl
            TUCA_CREATE_FILE(dnl
                TUCA_GS() -dBATCH -dNOPAUSE -q -dPDFSETTINGS=/prepress dnl
                -sDEVICE=pdfwrite -dDownsampleColorImages=true dnl
                -dDownsampleGrayImages=true -dDownsampleMonoImages=true dnl
                -dColorImageResolution=72 -dGrayImageResolution=72 dnl
                -dMonoImageResolution=72 -sOutputFile=TUCA_OUT() TUCA_IN(),dnl cmd
                TUCA_FILE(),dnl input
                TUCA_FILE(),dnl output
                ),dnl
            TUCA_TRANSLATE(Optimizing PDF),dnl loop description
            )dnl
        )dnl
    )</command>
    <description xml:lang="de">[Vorsicht: Qualitätsverlust] Es wird versucht, bei den ausgewählten PDF-Dokumenten die Dateigröße zu verringern.</description>
    <description xml:lang="en">[Caution: loss of quality!] An attempt to reduce the file size of each selected PDF file is made.</description>
	<patterns>*.PDF;*.pdf</patterns>
	<other-files/>
</action>
</actions>

