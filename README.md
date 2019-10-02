# My dotfiles

Here are the configuration files for my Arch Linux build. Currently I save this directory in *~/.dotfiles* and, when rebuilding my system, just send to a terminal:

```shell
git clone https://github.com/marcosrdac/dotfiles -o ~/.dotfiles
```

and basically symlink all the files to their places inside ~/ (what is really easy to do from **vifm**, so I don't believe I'm ever going to script for that).

## Dependencies

There are programs that I need Installed in order for my configs work correctly. I'll try to list them here.


### From Arch Oficial Repositories

```
yay
zsh zsh-syntax-highlighting
mlocate
wget curl git
xclip xsel xdotool
zip unzip unrar
texlive
...  # update it in the future...
unclutter
scrot
tmux
zathura zathura-cb zathura-djvu zathura-pdf-mupdf zathura-ps
youtube-dl
urlscan
```


### From AUR

```
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


