<?xml version="1.0" encoding="UTF-8"?>
<!-- 
Image manipulation Thunar custom actions
include(tuca.m4)dnl
-->
<actions>
<action>
	<icon>edit-redo</icon>
	<name xml:lang="de">im Uhrzeigersinn drehen</name>
	<name xml:lang="en">turn clockwise</name>
	<command>TUCA_LOOP(TUCA_CONVERT() -rotate 90 TUCA_FILE() TUCA_TEMP())</command>
	<description xml:lang="en">The selected images are turned clockwise.</description>
	<description xml:lang="de">Die ausgewählten Bilder werden im Uhrzeigersinn gedreht.</description>
	<patterns>*</patterns>
	<image-files/>
</action>
<action>
	<icon>edit-undo</icon>
	<name xml:lang="de">gegen den Uhrzeigersinn drehen</name>
	<name xml:lang="en">turn anti-clockwise</name>
	<command>TUCA_LOOP(TUCA_CONVERT() -rotate 270 TUCA_FILE() TUCA_TEMP())</command>
	<description xml:lang="en">The selected images are turned anti-clockwise.</description>
	<description xml:lang="de">Die ausgewählten Bilder werden gegen den Uhrzeigersinn gedreht.</description>
	<patterns>*</patterns>
	<image-files/>
</action>
<action>
	<icon>applications-graphics-symbolic</icon>
	<name xml:lang="de">in Graustufen umwandeln</name>
	<name xml:lang="en">convert to grayscale</name>
	<command>TUCA_LOOP(TUCA_CONVERT() TUCA_FILE() -set colorspace Gray -separate -average TUCA_TEMP())</command>
	<description xml:lang="de">arithmetische Mittelung aller Farbkanäle</description>
	<description xml:lang="en">The selected images are converted to grayscale by averaging the RGB-channels.</description>
	<patterns>*</patterns>
	<startup-notify/>
	<image-files/>
</action>
<action>
	<icon>color-fill</icon>
	<name xml:lang="de">Transparenz füllen</name>
	<name xml:lang="en">fill transparency</name>
	<command>COLOR=$(TUCA_COLOR_SELECTION()) || exit;TUCA_LOOP(TUCA_CONVERT() TUCA_FILE() -background "$COLOR" -alpha remove TUCA_TEMP())</command>
	<description xml:lang="de">Bei den ausgewählten Bildern werden transparente Bereiche mit der ausgewählten Farbe gefüllt.</description>
	<description xml:lang="en">The alpha channel in the selected images is filled with the selected color.</description>
	<patterns>*</patterns>
	<image-files/>
</action>
<action>
	<icon>window-restore-symbolic</icon>
	<name xml:lang="de">Bilder verkleinern</name>
	<name xml:lang="en">shrink images</name>
	<command>SCALE=$(TUCA_ZENITY() --text="%%" --scale --value=50 --min-value=1 --max-value=99) || exit;TUCA_LOOP(TUCA_CONVERT() TUCA_FILE() -resize ${SCALE}%% TUCA_TEMP())</command>
	<description xml:lang="de">Die ausgewählten Bilder werden auf einen gewählten Prozentsatz der ursprünglichen Größe skaliert.</description>
	<description xml:lang="en">The selected images are scaled to a given percentage of the original size.</description>
	<patterns>*</patterns>
	<image-files/>
</action>
</actions>

