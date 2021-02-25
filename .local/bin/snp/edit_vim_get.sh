RUN=/tmp

editarray()  # if files aren't changed yet
{
  VIM=${VIM:-vim}
  OLDNAMES="$(mktemp "$RUN/oldnames.XXX")"
  NEWNAMES="$(mktemp "$RUN/newnames.XXX")"

  TMPFILES="$TMPFILES $OLDNAMES $NEWNAMES"

  # initializing tmp files
  for filename in "$@"
  do
    echo "$filename" >> "$OLDNAMES"
  done 
  cp "$OLDNAMES" "$NEWNAMES"

  $VIM -O "$NEWNAMES" \
    -c "vert sview $OLDNAMES" \
    -c "wincmd x" \
    -c ":au BufWritePost $NEWNAMES :au BufLeave $NEWNAMES :qa"

  [ "$(wc -l <"$NEWNAMES")" -eq $# ] || return 1
  EDITED="$(<"$NEWNAMES")"
}

editarrays()  # if files has no "\n"
{
  VIM=${VIM:-vim}
  OLDNAMES="$(mktemp "$RUN/oldnames.XXX")"
  NEWNAMES="$(mktemp "$RUN/newnames.XXX")"

  TMPFILES="$TMPFILES $OLDNAMES $NEWNAMES"

  # initializing tmp files
  for filename in "$@"
  do
    echo "$filename" | sed -e ':a' -e 'N' -e '$!ba' \
                           -e 's/\n/'\$\'\\\\n\''/g'
  done >> "$OLDNAMES"
  cp "$OLDNAMES" "$NEWNAMES"

  $VIM -O "$NEWNAMES" \
    -c "vert sview $OLDNAMES" \
    -c "wincmd x" \
    -c ":au BufWritePost $NEWNAMES :au BufLeave $NEWNAMES :qa"

  [ "$(wc -l <"$NEWNAMES")" -eq $# ] || return 1
  EDITED="$(<"$NEWNAMES")"
}


editarray()
{
  VIM=${VIM:-vim}
  OLDNAMES="$(mktemp "$RUN/oldnames.XXX")"
  NEWNAMES="$(mktemp "$RUN/newnames.XXX")"

  TMPFILES="$TMPFILES $OLDNAMES $NEWNAMES"

  # initializing tmp files
  for filename in "$@"
  do
    echo "$filename" >> "$OLDNAMES"
  done 
  cp "$OLDNAMES" "$NEWNAMES"

  $VIM -O "$NEWNAMES" \
    -c "vert sview $OLDNAMES" \
    -c "wincmd x" \
    -c ":au BufWritePost $NEWNAMES :au BufLeave $NEWNAMES :qa"

  [ "$(wc -l <"$NEWNAMES")" -eq $# ] || return 1
  EDITED="$(<"$NEWNAMES")"
}
