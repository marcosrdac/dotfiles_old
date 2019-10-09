# My dotfiles

Here are the configuration files for my Arch Linux build. Currently I save this directory in "~/.dotfiles" and, when rebuilding my system, just send to a terminal:

```shell
git clone https://github.com/marcosrdac/dotfiles ~/.dotfiles
```

and basically symlink all the files to their places inside ~/ (what is really easy to do from *vifm*, so I don't believe I'm ever going to make script for that). There are also some symlinks I make in order for my GTK2 themes to work (I hate to have to make this extra step):

```shell
ln -s ~/.local/share/themes ~/.themes
ln -s ~/.local/share/icons ~/.icons
```

Then I select the FlatColor theme in *lxappearance*, and themes will be working fine (sadly, it creates the "~/.gtkrc-2.0", which seems to be needed for gtk2 theming...).

It's important to make the packages inside "~/.local/bin/st" and "~/.local/bin/dmenu" with:

```shell
cd ~/.local/bin/dmenu
make
sudo make install

cd ~/.local/bin/st
make
sudo make install
```

Then I set *zsh* to my user's default shell:

```shell
chsh -s $(which zsh)
```

I also give permissions for me to shutdown my PC without password, putting the next line in "/etc/sudoers" --- analyze it later:

```
%wheel  ALL=NOPASSWD: /sbin/shutdown, /sbin/poweroff, /sbin/halt, /sbin/reboot, /bin/systemctl suspend, /sbin/mount, /sbin/umount
```

Set udev rules for backlight in the file "/etc/udev/rules.d/90-backlight.rules":
```shell
SUBSYSTEM==“backlight”, ACTION==“add”,
ACTION=="change", SUBSYSTEM=="backlight", RUN+="/usr/bin/chgrp wheel /sys/class/backlight/%k/brightness"
ACTION=="change", SUBSYSTEM=="backlight", RUN+="/usr/bin/chmod g+w /sys/class/backlight/%k/brightness"
```

If you want external drives automounting, use:
```shell
systemctl enable devmon@$USER
systemctl start devmon@$USER
```


## Dependencies

There are programs that I need Installed in order for my configs to work correctly. I'll try to list them here.


### From Arch Oficial Repositories

```
mlocate
udevil
zsh zsh-syntax-highlighting
feh
xorg xorg-server xorg-xinit xorg-apps
lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings  # not really necessary
alsa alsa-utils alsa-tools pulseaudio-alsa
mpd mpc ncmpcpp
i3 i3blocks perl-anyevent-i3
compton unclutter redshift scrot acpi brightnessctl mpv
libnotify dunst
wget curl git
xclip xsel xdotool
zip unzip unrar
texlive
unclutter
scrot
tmux
vifm thunar
zathura zathura-cb zathura-djvu zathura-pdf-mupdf zathura-ps
youtube-dl
urlscan
qutebrowser firefox
transmission-cli
```


### From AUR

```
yay
pulseaudio pamixer
python-ueberzug
xinit-xsession
dropbox dropbox-cli
keepassx2 python-keepmenu
python-ueberzug
wpgtk
tremc
```


## To-do

  * make init.vim from nvim compatible to vim; and
  * see if I can securely upload my offlineimaprc.


