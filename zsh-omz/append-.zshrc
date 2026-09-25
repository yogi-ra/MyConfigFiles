if [[ -z "$DISPLAY" && -n "$SSH_CONNECTION" ]]; then
  clipcopy() { printf '\e]52;c;%s\a' "$(base64 | tr -d '\n')"; }
  clippaste() { print -u2 "clippaste: not supported over SSH — paste locally"; return 1; }
fi
