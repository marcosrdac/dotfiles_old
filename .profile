#!/usr/bin/env sh

echo test test test
. $HOME/.config/shell/shenv
. $HOME/.config/shell/shrc

startup
PATH="/usr/sbin:/sbin:/bin:/usr/games:$PATH"
