# How to contribute to thunar-custom-actions

Contributions are very welcome.

## Translations

This project uses **gettext** for localisation. The translation catalogues (`*.po`-files) can be found under the `locale` directory structured in the usual way. You may use the awesome translation program [poedit](https://github.com/vslavik/poedit) to edit them.

If you wanted to add a whole new language, do the following:

1. Clone the repository: `git clone https://github.com/nobodyinperson/thunar-custom-actions && cd thunar-custom-actions`
2. Create an empty new catalogue for your language, (e.g. Czech `cs`): `mkdir -p locale/cs/LC_MESSAGES && touch locale/cs/LC_MESSAGES/thunar-custom-actions.po`.
3. Configure the project with `./configure`.
4. Now we have a `Makefile` to build the project with `make`.
5. The newly created message catalogue can now be filled with e.g. [poedit](https://github.com/vslavik/poedit): `poedit locale/cs/LC_MESSAGES/thunar-custom-actions.po`.
6. After filling the message catalogue you may build and install the project as usual.
7. File a Pull Request on GitHub so I can include the new language into the code base.

If you encounter problems with translations not being applied, re-add the **thunar-custom-actions**: `uca-apply remove && uca-apply update`

## Custom actions

If you want to see one of your own custom actions come with **thunar-custom-actions**, take a look at the files under `share/thunar-custom-actions/system-uca`, add your changes there and then file a Pull Request. Alternatively, if you don't know how to do that or don't understand my system, you may also open a [new Issue here on GitHub](https://github.com/nobodyinperson/thunar-custom-actions/issues/new).
