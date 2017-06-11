<?xml version="1.0" encoding="UTF-8"?>
<!-- 
En/Decryption of files with GPG
include(tuca.m4)dnl
-->
<actions>
<action>
	<icon>gcr-gnupg</icon>
	<name xml:lang="de">symmetrisch mit GPG verschlüsseln</name>
	<name xml:lang="en">Encrypt symmetrically with GPG</name>
	<command>TUCA_INIT();PASSWORD=$(TUCA_ZENITY() --password --text="$(eval_gettext 'Password?')") || exit;TUCA_LOOP(TUCA_LOOP_PB_TEXT($(eval_gettext 'encrypting... $TUCA_FILE_BASE_VAR()'));TUCA_OUT_VAR()=TUCA_FILE().asc;echo $PASSWORD | TUCA_GPG2() --batch --yes --passphrase-fd 0 --symmetric --armor --cipher-algo AES256 -o TUCA_TEMP() TUCA_FILE())</command>
    <description xml:lang="de">Die ausgewählten Dateien werden symmetrisch mit einem Password mit GPG verschlüsselt.</description>
    <description xml:lang="en">Each selected file is encrypted symmetrically with one given password with GPG.</description>
	<patterns>*</patterns>
	<audio-files/>
	<image-files/>
	<other-files/>
	<text-files/>
	<video-files/>
</action>
<action>
	<icon>gcr-gnupg</icon>
	<name xml:lang="de">symmetrisch mit GPG entschlüsseln</name>
	<name xml:lang="en">Decrypt symmetrically with GPG</name>
	<command>TUCA_INIT();PASSWORD=$(TUCA_ZENITY() --password --text="$(eval_gettext 'Password?')");TUCA_LOOP(TUCA_LOOP_PB_TEXT($(eval_gettext 'decrypting... $TUCA_FILE_BASE_VAR()'));base="$(basename TUCA_FILE() .asc)";TUCA_OUT_VAR()=$(dirname TUCA_FILE())/$base;echo $PASSWORD | TUCA_GPG2() --batch --yes --passphrase-fd 0 --decrypt --cipher-algo AES256 -o TUCA_TEMP() TUCA_FILE() || FAIL=yes;if test -n "$FAIL";then TUCA_ZENITY() --warning --text="$(eval_gettext 'Wrong Password for $TUCA_FILE_BASE_VAR()?')";exit;fi)</command>
    <description xml:lang="de">Die ausgewählten Dateien werden symmetrisch mit einem Password mit GPG entschlüsselt.</description>
    <description xml:lang="en">Each selected file is decrypted symmetrically with one given password with GPG.</description>
	<patterns>*.asc</patterns>
	<other-files/>
</action>
</actions>

