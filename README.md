# System-wide Thunar custom actions

The [Thunar file browser](http://docs.xfce.org/xfce/thunar/start) has this awesome [custom actions](http://docs.xfce.org/xfce/thunar/custom-actions) feature which can make working with Thunar pretty productive and personal.

Unfortunately, Thunar is not very flexible when it comes to the storing location of these custom actions: There is only one file `~/.config/Thunar/uca.xml` that can contain custom actions for that specific user. As far as I know, there is no possibility to define **system-wide** custom actions that apply to every user.

To have the same Thunar custom actions across your machines, you may synchronize the `uca.xml` file e.g. with Dropbox or [Syncthing](https://syncthing.net/). But still, I always find myself copy-pasting when I want to _share_ my custom actions with other people.

This is an attempt to realize system-wide Thunar custom actions that can easily be updated.

## What can it do?

There are currently actions for:

- **rotating** images
- **shrinking** images
- **grayscaling** images
- **removing alpha channel** from images
- **converting** images to an A4 multi-page **PDF** document
- **shrinking** PDF file sizes
- **de/encrypting** arbitrary files with GPG

Everything with a beautiful **progress bar** realized with `zenity`.

![thunar-custom-actions-v0 0 8-ss1](https://user-images.githubusercontent.com/19148271/26882399-95e61d6a-4b9a-11e7-8ab3-de5eb34b3fb9.png)

![thunar-custom-actions-v0 0 8-ss2](https://user-images.githubusercontent.com/19148271/26882400-967bb906-4b9a-11e7-999c-0142a802dd22.png)

## Installation

### Debian package

`thunar-custom-actions` is best installed via the Debian package obtainable at the [releases page](https://github.com/nobodyinperson/thunar-custom-actions/releases). Download the `*.deb`-package and install it like so:

```bash
dpkg -i thunar-custom-actions-*.deb
```

### Apt repository (automatic updates)

If you use my [apt repository](http://apt.nobodyinperson.de), installation is even easier:

```bash
sudo apt-get update && sudo apt-get install thunar-custom-actions
```

Also, you will get automatic updates when using my repository.

### by hand

You can also install `thunar-custom-actions` by hand. You may want to do that if you don't have root privileges on your machine:

```bash
# clone the repository
git clone https://github.com/nobodyinperson/thunar-custom-actions
cd thunar-custom-actions
./configure --prefix=$HOME/.local PASSWDFILE=/etc/passwd
make
make install
```

To merge the actions provided by `thunar-custom-actions` into your Thunar configuration, run:

```bash
uca-apply update
```

If you don't want them anymore, run:

```bash
uca-apply remove
```

To uninstall `thunar-custom-actions`:

```bash
make uninstall
```

To upgrade to the latest development version:

```bash
uca-apply remove
make uninstall
git pull
./configure --prefix=$HOME/.local PASSWDFILE=/etc/passwd
make
make install
uca-apply update
```

## Contribute

If you would like to add translations or your own custom actions, take a look at the files under `share/thunar-custom-actions/system-uca`, add your changes there and then file a Pull Request.
