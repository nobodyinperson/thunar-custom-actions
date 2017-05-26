# System-wide Thunar custom actions

The [Thunar file browser](http://docs.xfce.org/xfce/thunar/start) has this awesome [custom actions](http://docs.xfce.org/xfce/thunar/custom-actions) feature which can make working with Thunar pretty productive and personal.

Unfortunately, Thunar is not very flexible when it comes to the storing location of these custom actions: There is only one file `~/.config/Thunar/uca.xml` that can contain custom actions for that specific user. As far as I know, there is no possibility to define **system-wide** custom actions that apply to every user.

To have the same Thunar custom actions across your machines, you may synchronize the `uca.xml` file e.g. with Dropbox or [Syncthing](https://syncthing.net/). But still, I always find myself copy-pasting when I want to _share_ my custom actions with other people.

This is an attempt to realize system-wide Thunar custom actions that can easily be updated.
