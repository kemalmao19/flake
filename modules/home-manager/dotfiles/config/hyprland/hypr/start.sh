#!/usr/bin/env bash

# initializing wallpaper daemon
swww-daemon &
# setting wallpaper
swww img ~/.config/hypr/wallpaper.jpg &

#network manager applet
nm-applet --indicator & 

# the bar
waybar &

# dunst
dunst
