#!/usr/bin/env bash

# the bar
waybar &

# initializing wallpaper daemon
swww-daemon &
# setting wallpaper
swww img ~/.config/hypr/wallpaper.jpg &

#network manager applet
nm-applet --indicator & 

# idle 
hypridle &

# notification
# dunst
swaync
