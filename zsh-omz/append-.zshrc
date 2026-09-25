if [[ -n "$TMUX" ]]; then
  clipcopy() {
    tmux load-buffer -w - 2>/dev/null && return 0
    printf '\ePtmux;\e\e]52;c;%s\a\e\\' "$(base64 | tr -d '\n')"
  }
  clippaste() { tmux save-buffer - }

elif [[ -n "$DISPLAY" ]]; then
  clipcopy()  { xclip -selection clipboard -in }
  clippaste() { xclip -selection clipboard -out }

elif [[ -n "$SSH_CONNECTION" ]]; then
  clipcopy()  { printf '\e]52;c;%s\a' "$(base64 | tr -d '\n')" }
  clippaste() { print -u2 "clippaste: not supported over SSH — paste locally"; return 1 }
fi
