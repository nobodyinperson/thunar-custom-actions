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
            TUCA_CONVERT() -rotate 90 TUCA_IN() TUCA_OUT(),dnl
            TUCA_TRANSLATE(Rotating clockwise),dnl
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
	<name xml:lang="de">gegen den Uhrzeigersinn drehen</name>
	<name xml:lang="en">Turn anti-clockwise</name>
	<command>TUCA_CMD(dnl
    TUCA_PROGRESSBAR(dnl
        TUCA_LOOP(dnl
            TUCA_CONVERT() -rotate 270 TUCA_IN() TUCA_OUT(),dnl
            TUCA_TRANSLATE(Rotating anti-clockwise),dnl
            )dnl
        )dnl
    )</command>
	<description xml:lang="en">The selected images are turned anti-clockwise.</description>
	<description xml:lang="de">Die ausgewählten Bilder werden gegen den Uhrzeigersinn gedreht.</description>
	<patterns>*</patterns>
	<image-files/>
</action>
<action>
	<icon>applications-graphics-symbolic</icon>
	<name xml:lang="de">in Graustufen umwandeln</name>
	<name xml:lang="en">Convert to grayscale</name>
	<command>TUCA_CMD(dnl
    TUCA_PROGRESSBAR(dnl
        TUCA_LOOP(dnl
            TUCA_CONVERT() TUCA_IN() -set colorspace Gray -separate -average TUCA_OUT(),dnl
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
            TUCA_CONVERT() TUCA_IN() -background "$COLOR" -alpha remove TUCA_OUT(),dnl
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
            TUCA_CONVERT() TUCA_IN() -resize ${SCALE}%% TUCA_OUT(),dnl
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

