# System-wide Thunar custom actions

## What is this?

The [Thunar file browser](http://docs.xfce.org/xfce/thunar/start) has this awesome [custom actions](http://docs.xfce.org/xfce/thunar/custom-actions) feature which can make working with Thunar pretty productive and personal.

Unfortunately, Thunar is not very flexible when it comes to the storing location of these custom actions: There is only one file `~/.config/Thunar/uca.xml` that can contain custom actions for that specific user. As far as I know, there is no possibility to define **system-wide** custom actions that apply to every user.

This is an attempt to realize **system-wide Thunar custom actions** that can easily be **updated and maintained**.

## Motivation

Writing your own custom actions for Thunar by hand can become frustrating pretty quickly. Eventually you will come to the point, where you would like to make it a little more sophisticated by adding one or more of the features below. This piece of software **thunar-custom-actions** addresses all of the following features:

| Feature | Approach |
|---------|----------|
|ensure **all needed software is present**, e.g. on configuration migration or system reinstallation | `configure` or rather the `Depends:` section in the debian package |
|ensure nonexistent files don't get **accedentally overwritten**|ask the user for **overwriting confirmation**|
|ensure a broken or failing action command does not **accedentally delete files**|cache an action's output in a **temporary file** before copying it over to the final location|
|indicate **progress on long-running actions**|where possible, display a **progressbar**|
|be able to **interrupt an action**|the **Cancel** button on the **progressbar**|
|warn if an **action failed**|show a **warning message**|
|provide **translations**|localisation with **gettext**|
|maintenance: be able to apply changes **to all actions at once**|use `m4` as preprocessor|

## What can it do?

There are currently actions for:

- **rotating** images
- **shrinking** images
- **grayscaling** images
- **filling transparent areas** in images with a given color
- **converting** images to an A4 multi-page **PDF** document
- **concatenating** PDF documents into one
- **shrinking** PDF file sizes
- **de/encrypting** arbitrary files with GPG
- **finding big elements** in a folder
- **creating symbolic links** to files
- **showing checksums** (MD5,SHA1,SHA256) of files
 
Everything with a beautiful **progress bar** realized with `zenity`.
Of course, I tried to make everything work regardless of ugly characters (e.g. whitespace) in the filename.

## Screenshots

See some screenshots:

### Rotating images

![thunar-custom-actions-image-actions-context-menu](https://user-images.githubusercontent.com/19148271/27011809-1a44c120-4ec4-11e7-9c17-892adb147e85.png)

![thunar-custom-actions-image-rotating-progressbar](https://user-images.githubusercontent.com/19148271/27011807-1a3fe768-4ec4-11e7-890e-c8c8f94b48d5.png)

### Encrypting files

![thunar-custom-actions-image-actions-context-menu-gpg-encrypt](https://user-images.githubusercontent.com/19148271/27011808-1a404c6c-4ec4-11e7-9a83-43c02271d6bd.png)

![thunar-custom-actions-gpg-encrypt](https://user-images.githubusercontent.com/19148271/27011810-1a49c026-4ec4-11e7-9c29-2a2b22cd1efd.png)

### Finding space-consuming elements in a folder

![thunar-custom-actions-folder-find-big-elements-context-menu](https://user-images.githubusercontent.com/19148271/27011804-1a071d20-4ec4-11e7-9bfd-40e1b015061b.png)

![thunar-custom-actions-folder-find-big-elements-progressbar](https://user-images.githubusercontent.com/19148271/27011805-1a28d1a4-4ec4-11e7-9873-51ed8338a526.png)

![thunar-custom-actions-folder-find-big-elements-view](https://user-images.githubusercontent.com/19148271/27011806-1a3920f4-4ec4-11e7-856c-a6ce6746de17.png)

### Showing checksums of files

![thunar-custom-actions-checksums-context-menu](https://user-images.githubusercontent.com/19148271/27080706-632ecd52-503d-11e7-989a-0f0aaf5b8185.png)

![thunar-custom-actions-checksums-view](https://user-images.githubusercontent.com/19148271/27080708-6335f898-503d-11e7-82a7-22e749b2db84.png)

### Overwriting confirmation

![thunar-custom-actions-overwrite-question](https://user-images.githubusercontent.com/19148271/27080707-63307c74-503d-11e7-8b16-f02699e4e0e2.png)

## How does it work?

At its heart, **thunar-custom-actions** is actually just the script (Makefile) `bin/uca-apply` that instructs the Python script `bin/uca-manip` to **merge** or **remove** the custom actions provided by **thunar-custom-actions** (the files `share/thunar-custom-actions/system-uca/*.xml`) into [the|each] user's Thunar configuration `~/.config/Thunar/uca.xml`.

The actions itself are (pretty long) pre-processed shell commands in the `<command>`-tags of the configuration file. The macro language `m4` is used for pre-processing. This enables sophisticated commands to be written as very simple `m4`-macros which are scalable and easily maintainable.

The [Debian package](#debian-package) takes care of the actions provided by **thunar-custom-actions** automatically:

- **adding** them to the users' configurations on **package installation**
- **removing** them from the users' configurations on **package removal**
- **removing** the old, then **adding** the new actions on **package update**

The [manual installation](#manual-install) requires the user to do this himself.

The action merging/removal process is designed to **NOT touch the actions that were there before**! It *should* leave them totally untouched. So you *should* be safe to just try **thunar-custom-actions** and if you don't like it, uninstall it again without causing any damage to your configuration. But as always, you are encouraged to **backup your `~/.config/Thunar/uca.xml` file** before using **thunar-custom-actions** if you care about your already-defined custom actions.


## Installation

I am testing **thunar-custom-actions** regularly on several different machines running **Xubuntu 16.04 LTS**. But as soon as you got it installed properly, it should work regardless of the system used. If you encounter any problems installing or using **thunar-custom-actions**, feel free to open a [new Issue here on GitHub](https://github.com/nobodyinperson/thunar-custom-actions/issues/new) and describe your problem.

<a name="debian-package"></a>
### Debian package

**thunar-custom-actions** is best installed via the Debian package obtainable at the [releases page](https://github.com/nobodyinperson/thunar-custom-actions/releases). Download the `*.deb`-package and install it like so:

```bash
sudo dpkg -i thunar-custom-actions*.deb || sudo apt-get install -f -y
```

### Apt repository (automatic updates)

If you use my [apt repository](http://apt.nobodyinperson.de), installation is even easier:

```bash
sudo apt-get update && sudo apt-get install thunar-custom-actions
```

Also, you will get automatic updates when using my repository.

<a name="manual-install"></a>
### By hand

You can also install **thunar-custom-actions** by hand. You may want to do that if you don't have root privileges on your machine, or you are using a distribution that does not utilise the `.deb` software package format.

```bash
# clone the repository
git clone https://github.com/nobodyinperson/thunar-custom-actions
cd thunar-custom-actions
./configure --prefix=$HOME/.local PASSWDFILE=/etc/passwd
make
make install
```

To merge the actions provided by **thunar-custom-actions** into your Thunar configuration, run:

```bash
uca-apply update
```

If you don't want them anymore, run:

```bash
uca-apply remove
```

To uninstall **thunar-custom-actions**, run from the git repository root:

```bash
make uninstall
```

To upgrade to the latest development version, run from the repository root:

```bash
uca-apply remove
make uninstall
git pull
./configure --prefix=$HOME/.local PASSWDFILE=/etc/passwd
make
make install
uca-apply update
```

## Troubleshooting

#### *Help, there are no new actions after the installation!*

Close all `thunar` instances, run `thunar -q` from the terminal and then retry.

#### *Help, I changed my system's language but the actions are still in the old language!*

This is because Thunar drops all translations but the current locale from its custom actions configuration file.
Close all Thunar windows, then run `uca-apply remove && uca-apply update && thunar -q` to re-add all translations. The next time Thunar is opened, it will again remove all translations but the (desired) current locale.

## How to contribute

Contributions are very welcome.

### Translations

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

### Custom actions

If you want to see one of your own custom actions come with **thunar-custom-actions**, take a look at the files under `share/thunar-custom-actions/system-uca`, add your changes there and then file a Pull Request. Alternatively, if you don't know how to do that or don't understand my system, you may also open a [new Issue here on GitHub](https://github.com/nobodyinperson/thunar-custom-actions/issues/new).
