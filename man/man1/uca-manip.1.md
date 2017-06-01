% uca-manip(1) | Thunar custom actions XML file manipulator

NAME
====


**uca-manip** - a tool to manipulate Thunar custom actions XML files

SYNOPSIS
========

usage: uca-manip [-h] [-o OUTPUT] files [files ...]

Merge two or more Thunar custom action XML files. \<actions\> are assumed as
equal, if all content matches. The \<unique-id\> is ignored for this check. The
first file will be used as the base.

positional arguments:
  files                 xml files to merge

optional arguments:
  -h, --help            show this help message and exit
  -o OUTPUT, --output OUTPUT
                        output xml file

AUTHOR
======


Yann Büchau <nobodyinperson@gmx.de>


