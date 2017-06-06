<?xml version="1.0" encoding="UTF-8"?>
<!-- 
Image manipulation Thunar custom actions
include(tuca.m4)dnl
-->
<actions>
<action>
	<icon>edit-redo</icon>
	<name>im Uhrzeigersinn drehen</name>
	<command>TUCA_LOOP(convert -rotate 90 $TUCA_FILE $TUCA_TEMP)</command>
	<description>Markierte Bilder im Uhrzeigersinn drehen</description>
	<patterns>*</patterns>
	<image-files/>
</action>
<action>
	<icon>edit-undo</icon>
	<name>gegen den Uhrzeigersinn drehen</name>
	<command>TUCA_LOOP(convert -rotate 270 $TUCA_FILE $TUCA_TEMP)</command>
	<description>Markierte Bilder werden gegen den Uhrzeigersinn gedreht</description>
	<patterns>*</patterns>
	<image-files/>
</action>
<action>
	<icon>applications-graphics-symbolic</icon>
	<name>in Graustufen umwandeln</name>
	<command>TUCA_LOOP(convert $TUCA_FILE -set colorspace Gray -separate -average $TUCA_TEMP)</command>
	<description>arithmetische Mittelung aller Farbkanäle</description>
	<patterns>*</patterns>
	<startup-notify/>
	<image-files/>
</action>
<action>
	<icon>image-missing</icon>
	<name>Transparenz entfernen</name>
	<command>TUCA_LOOP(convert $TUCA_FILE -alpha off $TUCA_TEMP)</command>
	<description>Bei den ausgewählten Bildern wird der Alphakanal entfernt.</description>
	<patterns>*</patterns>
	<image-files/>
</action>
<action>
	<icon>window-restore-symbolic</icon>
	<name>Auflösung halbieren</name>
	<command>TUCA_LOOP(convert $TUCA_FILE -resize 50%% $TUCA_TEMP)</command>
	<description>Breite und Höhe der Bilder werden halbiert.</description>
	<patterns>*</patterns>
	<image-files/>
</action>
<action>
	<icon>window-restore-symbolic</icon>
	<name>Auflösung auf 75% reduzieren</name>
	<command>TUCA_LOOP(convert $TUCA_FILE -resize 75%% $TUCA_TEMP)</command>
	<description>Breite und Höhe der Bilder werden auf 75% reduziert.</description>
	<patterns>*</patterns>
	<image-files/>
</action>
</actions>

