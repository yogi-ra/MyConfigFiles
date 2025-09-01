#!/bin/sh

grim - | wl-copy

if [ $? -eq 0 ]; then
  notify-send -u normal -a fullscreen_screenshot -t 3000 "Screenshot saved to clipboard"
else
  notify-send -u normal -a fullscreen_screenshot -t 3000 "Failed to take screenshot"
  exit 1
fi
