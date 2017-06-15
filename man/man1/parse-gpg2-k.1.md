% parse-gpg2-k(1) | Parse gpg2 --list-public-keys output

NAME
====


**parse-gpg2-k** - Parse gpg2 --list-public-keys output

SYNOPSIS
========

usage: parse-gpg2-k

Given the output of `gpg2 --list-public-keys` on STDIN, parse it and output on
STDIN something like:

```
F1F7AS9F
Name of User 1
user1@internet.com
F1F7AS9F
Name of User 1
user1@othermailaddress.com
E7A9A15S
Name of User 2
user2_mail@emailhost.com
...
```


AUTHOR
======


Yann Büchau <nobodyinperson@gmx.de>


