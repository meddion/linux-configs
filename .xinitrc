#!/bin/bash
# .xinitrc allows you to execute commands at the beginning of the X 
# user session - before the window manager is started. 

# Load a resource file, and merge with the current settings 
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

# Statrting the commands
nm-applet --indicator & # Network monitor and control GUI applet 
picom -b # Compositor  
feh --bg-fill --randomize ~/Pictures/wallpapers/* & # Used for setting up wallpapers
flameshot & # Used for making screenshots
xbanish & # Hides cursor while typing 
redshift & # Adjusts the color temperature of the screen 
#deadd-notification-center &
#blueman-applet &

# Off the bell
xset -b
# Stop screen from going blank
xset s off
xset -dpms
xset s noblank
# Faster key repeat and delay
xset r rate 210 40

# Debug flag: --shmlog-size=26214400
exec i3 

