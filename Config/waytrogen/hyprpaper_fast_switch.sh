#!/usr/bin/env bash

# Wallpaper path from the 2nd argument
WALLPAPER="$2"

# Path to Hyprland wallpaper config
CONF_FILE="/home/Dr/.config/hypr/hyprpaper.conf"

# Write the two lines to the config (replace the entire file)
{
    echo "preload=$WALLPAPER"
    echo "wallpaper=eDP-1,$WALLPAPER"
} > "$CONF_FILE"

