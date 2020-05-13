# My dotfiles

Here are the configuration files for my Arch Linux build. Currently I save this directory in "~/.dotfiles" and, when rebuilding my system, just send to a terminal:

```shell
git clone https://github.com/marcosrdac/dotfiles $HOME/.dotfiles
```

or, better, for ssh cloning (remember to create your SSH keys and add them to GitHub!):

```shell
git clone git@github.com:marcosrdac/dotfiles.git $HOME/.dotfiles
```

and basically symlink all the files to their places inside ~/ (what is really easy to do from *vifm*, so I don't believe I'm ever going to make script for that). There are also some symlinks I make in order for my GTK2 themes to work (I hate having to make this extra step):

```shell
ln -s ~/.local/share/themes ~/.themes
ln -s ~/.local/share/icons ~/.icons
```

Then I select the FlatColor theme in *lxappearance*, and themes will be working fine (sadly, it creates the "~/.gtkrc-2.0", which seems to be needed for gtk2 theming...).

It's important to make the packages inside "\~/.local/bin/st" and "\~/.local/bin/dmenu" with:

```shell
cd ~/.local/bin/dmenu
make
sudo make install

cd ~/.local/bin/st
make
sudo make install
```

So that you have a terminal and the menu program I use. Then I set *zsh* to my user's default shell:

```shell
chsh -s $(which zsh)
```

I also give permissions for me to shutdown my PC without password, putting the next line in "/etc/sudoers":

```
%wheel ALL=(ALL) NOPASSWD: /sbin/shutdown, /sbin/poweroff, /sbin/halt, /sbin/reboot, /bin/systemctl suspend, /sbin/mount, /sbin/umount
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
# terminal multiplexer
tmux
# getting locate
mlocate
# mounting drives
udevil
# gettinh zsh
zsh zsh-syntax-highlighting
# alsa and pulse (pulse is on AUR bellow)
alsa alsa-utils alsa-tools pulseaudio-alsa
# X
xorg xorg-server xorg-xinit xorg-apps
# window manager
bspwm polybar yad networkmanager-dmenu
compton sox unclutter redshift scrot acpi brightnessctl mpv
# wallpaper setting
xwallpaper
# file managers
vifm thunar
# browsers
qutebrowser firefox
# music
mpd mpc ncmpcpp
# neomutt
neomutt urlscan
libnotify dunst
# web downloaders
wget curl git youtube-dl
# ssh client
openssh
# dealing with clipboard
xclip xsel xdotool
# file compression
zip unzip unrar
# latex
texlive
# making mouse cursor disappear
unclutter
# printscreen
scrot
# e-reader
zathura zathura-cb zathura-djvu zathura-pdf-mupdf zathura-ps
# torrents
transmission-cli
# lightdm: needed for using teamviewer
lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings
```


### From AUR

```
yay
# getting pulseaudio
pulseaudio pamixer
# view images from inside terminals
python-ueberzug
# making lightdm use xinit
xinit-xsession
# dropbox
dropbox dropbox-cli
# security
keepassx2 python-keepmenu
# making themes from pictures
wpgtk
# torrent visualizer
tremc
```


## To-do

  * see if I can securely upload my offlineimaprc.
