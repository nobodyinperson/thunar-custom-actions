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
	<command>TUCA_CMD(dnl
    PASSWORD=$(TUCA_PASSWORD()) || exit;dnl
    TUCA_PROGRESSBAR(dnl
        TUCA_LOOP(dnl
            echo $PASSWORD | TUCA_GPG2() --batch --yes --passphrase-fd 0 --symmetric --armor -o TUCA_OUT() TUCA_IN(),dnl
            TUCA_TRANSLATE(Encrypting),dnl
            TUCA_IN().asc,dnl output name
            )dnl
        )dnl
    )</command>
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
	<command>TUCA_CMD(dnl
    PASSWORD=$(TUCA_PASSWORD()) || exit;dnl
    TUCA_PROGRESSBAR(dnl
        TUCA_LOOP(dnl
            echo $PASSWORD | TUCA_GPG2() --batch --yes --passphrase-fd 0 --decrypt -o TUCA_OUT() TUCA_IN() || FAIL=yes;dnl
            if test -n "$FAIL";then TUCA_ERROR(TUCA_TRANSLATE(Wrong Password for $TUCA_FILE_BASE_VAR()?));exit;fi,dnl
            TUCA_TRANSLATE(Decrypting),dnl
            $(dirname TUCA_IN())/$(basename TUCA_IN() .asc),dnl output name
            )dnl
        )dnl
    )</command>
    <description xml:lang="de">Die ausgewählten Dateien werden symmetrisch mit einem Password mit GPG entschlüsselt.</description>
    <description xml:lang="en">Each selected file is decrypted symmetrically with one given password with GPG.</description>
	<patterns>*.asc</patterns>
	<other-files/>
</action>
</actions>

