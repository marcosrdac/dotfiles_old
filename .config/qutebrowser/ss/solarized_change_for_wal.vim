:%s/{/{{/g
:%s/}/}}/g

" degradeau...
:%s/#002b36/{background}/g
:%s/#073642/{background}/g
:%s/#586e75/{background}/g
:%s/#657b83/{background}/g
:%s/#839496/{foreground}/g
:%s/#93a1a1/{foreground}/g
:%s/#eee8d5/{foreground}/g
:%s/#fdf6e3/{foreground}/g

" from Xresources
:%s/#dc322f/{color1}/g
:%s/#859900/{color2}/g
:%s/#b58900/{color3}/g
:%s/#268bd2/{color4}/g
:%s/#d33682/{color5}/g
:%s/#2aa198/{color6}/g

" originally orange and violet, not compatible
:%s/#cb4b16/{color9}/g
:%s/#6c71c4/{color12}/g
