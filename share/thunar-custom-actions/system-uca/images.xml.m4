<?xml version="1.0" encoding="UTF-8"?>
<!-- 
Image manipulation Thunar custom actions
include(tuca.m4)dnl
-->
<actions>
<action>
	<icon>edit-redo</icon>
	<name xml:lang="de">im Uhrzeigersinn drehen</name>
	<name xml:lang="en">Turn clockwise</name>
	<command>TUCA_CMD(dnl
    TUCA_PROGRESSBAR(dnl
        TUCA_LOOP(dnl
            TUCA_CREATE_FILE(dnl
                TUCA_CONVERT() -rotate 90 TUCA_IN() TUCA_OUT(),dnl
                TUCA_FILE(),dnl input
                TUCA_FILE(),dnl output
                ),dnl
            TUCA_TRANSLATE(Rotating clockwise),dnl loop description
            )dnl
        )dnl
    )</command>
	<description xml:lang="en">The selected images are turned clockwise.</description>
	<description xml:lang="de">Die ausgewählten Bilder werden im Uhrzeigersinn gedreht.</description>
	<patterns>*</patterns>
	<image-files/>
</action>
<action>
	<icon>edit-undo</icon>
	<name xml:lang="de">Gegen den Uhrzeigersinn drehen</name>
	<name xml:lang="en">Turn anti-clockwise</name>
	<command>TUCA_CMD(dnl
    TUCA_PROGRESSBAR(dnl
        TUCA_LOOP(dnl
            TUCA_CREATE_FILE(dnl
                TUCA_CONVERT() -rotate 270 TUCA_IN() TUCA_OUT(),dnl
                TUCA_FILE(),dnl input
                TUCA_FILE(),dnl output
                ),dnl
            TUCA_TRANSLATE(Rotating anti-clockwise),dnl
            )dnl
        )dnl
    )</command> <description xml:lang="en">The selected images are turned anti-clockwise.</description>
	<description xml:lang="de">Die ausgewählten Bilder werden gegen den Uhrzeigersinn gedreht.</description>
	<patterns>*</patterns>
	<image-files/>
</action>
<action>
	<icon>insert-image</icon>
	<name xml:lang="de">In anderes Format umwandeln</name>
	<name xml:lang="en">Convert to other format</name>
	<command>TUCA_CMD(dnl
    FORMAT=$(dnl
        TUCA_CONVERT() -list format | dnl
        TUCA_PERL() -ane '($f,$m,$c,$d)=m/^\s*(\S*?)\**\s*(\S*)\s*([r-][w-][+-])\s*(.*)$/g;if($c=~m/^.w.$/){print join "\n",$f,$d,""}' | dnl
        TUCA_ZENITY() --list dnl
            --print-column=1 dnl
            --column="TUCA_TRANSLATE(Format)" dnl
            --column="TUCA_TRANSLATE(Description)" dnl
            --text="TUCA_TRANSLATE(Select format:)" dnl
            --title="TUCA_TRANSLATE(Format)" dnl
        );dnl
    if test $? -ne 0;then dnl
        exit;dnl user aborted
    fi;dnl
    FORMAT=$(echo $FORMAT | TUCA_PERL() -ne 'print lc');dnl lower-case format
    if test -z "$FORMAT";then dnl
        TUCA_ERROR(TUCA_TRANSLATE(No format selected.) TUCA_TRANSLATE(If you see this message<~,~> please contact the developer on https://github.com/nobodyinperson/thunar-custom-actions.));dnl
        exit 1;dnl
    fi; dnl
    TUCA_PROGRESSBAR(dnl
        TUCA_LOOP(dnl
            TUCA_CREATE_FILE(dnl
                CONVERT_OUTPUT=$(TUCA_CONVERT() TUCA_IN() TUCA_OUT() 2>&amp;1;) || dnl
                    TUCA_ERROR(TUCA_TRANSLATE(Could not convert $TUCA_IN_VAR() to $FORMAT: $CONVERT_OUTPUT));dnl
                ,dnl end of command
                TUCA_FILE(),dnl input
                $(dirname TUCA_FILE())/$(basename TUCA_FILE() | TUCA_PERL() -pe 's#\.\w+<~$~>##g').${FORMAT},dnl output name
                ),dnl
            TUCA_TRANSLATE(Converting to $FORMAT),dnl loop description
            )dnl
        )dnl
    )</command>
	<description xml:lang="en">The selected images are converted to a specified format.</description>
	<description xml:lang="de">Die ausgewählten Bilder werden in ein angegebenes Format umgewandelt.</description>
	<patterns>*.pdf;*.PDF;*</patterns>
	<image-files/>
	<other-files/>
</action>
<action>
	<icon>applications-graphics-symbolic</icon>
	<name xml:lang="de">in Graustufen umwandeln</name>
	<name xml:lang="en">Convert to grayscale</name>
	<command>TUCA_CMD(dnl
    TUCA_PROGRESSBAR(dnl
        TUCA_LOOP(dnl
            TUCA_CREATE_FILE(dnl
                TUCA_CONVERT() TUCA_IN() -set colorspace Gray -separate -average TUCA_OUT(),dnl
                TUCA_FILE(),dnl input
                TUCA_FILE(),dnl output
                ),dnl
            TUCA_TRANSLATE(Converting to grayscale),dnl
            )dnl
        )dnl
    )</command>
	<description xml:lang="de">arithmetische Mittelung aller Farbkanäle</description>
	<description xml:lang="en">The selected images are converted to grayscale by averaging the RGB-channels.</description>
	<patterns>*</patterns>
	<startup-notify/>
	<image-files/>
</action>
<action>
	<icon>color-fill</icon>
	<name xml:lang="de">Transparenz füllen</name>
	<name xml:lang="en">Fill transparency</name>
	<command>TUCA_CMD(dnl
    COLOR=$(TUCA_COLOR_SELECTION()) || exit;dnl ask user for fill color
    TUCA_PROGRESSBAR(dnl
        TUCA_LOOP(dnl
            TUCA_CREATE_FILE(dnl
                TUCA_CONVERT() TUCA_IN() -background "$COLOR" -alpha remove TUCA_OUT(),dnl
                TUCA_FILE(),dnl input
                TUCA_FILE(),dnl output
                ),dnl
            TUCA_TRANSLATE(Filling transparency with $COLOR),dnl
            )dnl
        )dnl
    )</command>
	<description xml:lang="de">Bei den ausgewählten Bildern werden transparente Bereiche mit der ausgewählten Farbe gefüllt.</description>
	<description xml:lang="en">The alpha channel in the selected images is filled with the selected color.</description>
	<patterns>*</patterns>
	<image-files/>
</action>
<action>
	<icon>window-restore-symbolic</icon>
	<name xml:lang="de">Bilder verkleinern</name>
	<name xml:lang="en">Shrink images</name>
	<command>TUCA_CMD(dnl
    SCALE=$(TUCA_ZENITY() --text="TUCA_TRANSLATE(Scale to what percentage?)" --scale --value=50 --min-value=1 --max-value=99) || exit;dnl
    TUCA_PROGRESSBAR(dnl
        TUCA_LOOP(dnl
            TUCA_CREATE_FILE(dnl
                TUCA_CONVERT() TUCA_IN() -resize ${SCALE}%% TUCA_OUT(),dnl
                TUCA_FILE(),dnl input
                TUCA_FILE(),dnl output
                ),dnl
            TUCA_TRANSLATE(Scale to $SCALE percent),dnl
            )dnl
        )dnl
    )</command>
	<description xml:lang="de">Die ausgewählten Bilder werden auf einen gewählten Prozentsatz der ursprünglichen Größe skaliert.</description>
	<description xml:lang="en">The selected images are scaled to a given percentage of the original size.</description>
	<patterns>*</patterns>
	<image-files/>
</action>
</actions>

