#!/bin/bash

# Update package lists
sudo apt update

# Required packages for i3-gaps build & functionality
sudo apt install -y meson dh-autoreconf libxcb-keysyms1-dev libpango1.0-dev \
  libxcb-util0-dev libxcb1-dev libxcb-icccm4-dev libyajl-dev libev-dev \
  libxcb-xkb-dev libxcb-cursor-dev libxkbcommon-dev libxcb-xinerama0-dev \
  libxkbcommon-x11-dev libstartup-notification0-dev libxcb-randr0-dev \
  libxcb-xrm0 libxcb-xrm-dev libxcb-shape0 libxcb-shape0-dev i3status cmake

# Polybar and supporting tools
sudo apt install -y polybar rofi dunst libnotify-bin picom dmenu dbus-x11
