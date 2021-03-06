> # This project has moved to [Gitlab.com](https://gitlab.com/nobodyinperson/thunar-custom-actions)
> 
> The GitHub repository here is not up-to date.
> Please refer to [the repository on Gitlab.com](https://gitlab.com/nobodyinperson/thunar-custom-actions) for 
> Issues, Releases and the up-to-date repository code.

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
|ensure the actions work regardless of **ugly characters** in the filename (e.g. whitespace)|sensible **shell programming**|
|ensure existing files don't get **accidentally overwritten**|ask the user for **overwriting confirmation**|
|ensure a broken or failing action command does not **accidentally delete files**|cache an action's output in a **temporary file** before copying it over to the final location|
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
- **converting** images to arbitrary formats
- **concatenating** PDF documents into one
- **shrinking** PDF file sizes
- **de/encrypting** arbitrary files with GPG (both symmetrically and asymmetrically)
- **finding big elements** in a folder
- **creating symbolic links** to files and folders
- **showing checksums** (MD5,SHA1,SHA256) of files

## Screenshots

See some screenshots:

### Rotating images

![thunar-custom-actions-image-actions-context-menu](https://user-images.githubusercontent.com/19148271/27011809-1a44c120-4ec4-11e7-9c17-892adb147e85.png)

![thunar-custom-actions-image-rotating-progressbar](https://user-images.githubusercontent.com/19148271/27011807-1a3fe768-4ec4-11e7-890e-c8c8f94b48d5.png)

### Converting images to PDF

![thunar-custom-actions-choose-pdf-orientation](https://user-images.githubusercontent.com/19148271/27255107-6dc82fda-5397-11e7-8b0a-2364b1f528da.png)

### Converting images to arbitrary formats

![thunar-custom-actions-convert-format-context-menu-english](https://user-images.githubusercontent.com/19148271/27261299-c54197ca-5440-11e7-8f68-1400121caa41.png)

![thunar-custom-actions-choose-format-english](https://user-images.githubusercontent.com/19148271/27261296-c51790ec-5440-11e7-818b-6be989a0cf3b.png)

### Encrypting files

#### Symmetrically (with password)

![thunar-custom-actions-image-actions-context-menu-gpg-encrypt](https://user-images.githubusercontent.com/19148271/27011808-1a404c6c-4ec4-11e7-9a83-43c02271d6bd.png)

![thunar-custom-actions-gpg-encrypt](https://user-images.githubusercontent.com/19148271/27011810-1a49c026-4ec4-11e7-9c29-2a2b22cd1efd.png)

#### Aymmetrically (with public key)

![thunar-custom-actions-asym-gpg-encryption-context-menu](https://user-images.githubusercontent.com/19148271/27179093-654ddeca-51cd-11e7-95ac-94532143e988.png)

You then have to specify the recipient's public key from a list generated from a parsed output of `gpg2 --list-public-keys`:

![thunar-custom-actions-asym-gpg-encryption-key-selection](https://user-images.githubusercontent.com/19148271/27179092-654bff56-51cd-11e7-80ef-95025174fb79.png)

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

I am testing **thunar-custom-actions** regularly on several different machines running **Xubuntu 16.04 LTS**. Actually, as long as you get it `./configure`d without errors, it should work regardless of the system used. 

**Disclaimer**: I am paying a lot of attention here to prevent data loss or data corruption when executing the Thunar custom actions provided by **thunar-custom-actions** (e.g. by caching in temporary files, asking for overwriting permission, catching errors, etc...). Nonetheless I **cannot guarantee** that there are no cases where something might go haywire. So please use the actions provided with responsibility and the fact in mind that a mere mortal created them. I suggest you **backup sensitive or important data** you care about before running a custom action from here on it.

If you encounter any problems installing or using **thunar-custom-actions**, feel free to open a [new Issue here on GitHub](https://github.com/nobodyinperson/thunar-custom-actions/issues/new) and describe your problem.

<a name="debian-package"></a>
### Debian package

On Debian-based systems, **thunar-custom-actions** is best installed or updated via the Debian package.
A Debian package is obtainable either:

- via Download from the [releases page on GitHub](https://github.com/nobodyinperson/thunar-custom-actions/releases) or
- by creating it directly from the repository with `dpkg-buildpackage -us -uc` (You might need to `sudo apt-get install dpkg-dev` before.)

Then install the `*.deb`-package like so:

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

Errors when running `./configure` are most likely connected to requirements not being installed. It will tell you what's missing.

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

<a name="troubleshooting"></a>
## Troubleshooting

#### *Help, there are no new actions after the installation!*

If you installed it [manually](https://github.com/nobodyinperson/thunar-custom-actions/blob/master/README.md#manual-install), make sure that you did a `uca-apply update` afterwards to actually merge the actions provided by **thunar-custom-actions** into your Thunar configuration.

You may also close all `thunar` instances, run `thunar -q` from the terminal and then re-check if there are still no actions.

#### *Help, I clicked on an action but nothing happens!*

Okay, this should theoretically not happen. This probably means that either I didn't cover a special case in the code or that a software requirement is missing on your machine. To get more information on your problem:

- start `thunar` from the command-line
- repeat the steps to produce your problem
- save the output from the terminal
- open a [new Issue here on GitHub](https://github.com/nobodyinperson/thunar-custom-actions/issues/new) and paste it there so I can help you.

#### *Help, I changed my system's language but the actions are still in the old language!*

This is because Thunar drops all translations but the current locale from its custom actions configuration file.
Close all Thunar windows, then run `uca-apply remove && uca-apply update && thunar -q` to re-add all translations. The next time Thunar is opened, it will again remove all translations but the (desired) current locale.

## How to contribute

See the instructions in [CONTRIBUTING.md](https://github.com/nobodyinperson/thunar-custom-actions/blob/master/CONTRIBUTING.md).

