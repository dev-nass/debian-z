#!/bin/bash

# Rice Installer (cleaned, no neofetch/ufetch/nvim bloat)

cd
mkdir -p ~/.themes
mkdir -p ~/.icons

# --- Extract themes/icons/cursors ---
cd debian-z/theme
tar -xf BlueSky-Clean-Dark.tar.xz
tar -xf Sunity-cursors.tar.gz
tar -xf Adwaita-dark.tar
tar -xf Papirus-gray.tar.xz
tar -xf Graphite-Dark.tar.xz
tar -xzf Materia-Manjaro-gtk.tar.gz
unzip Nordic.zip
unzip Blackout.zip
unzip Flat-Remix-Grey-Dark.zip
tar -xzf Dracula.tar.gz
tar -xzf Dracula-icons.tar.gz

# --- Move to ~/.themes & ~/.icons ---
cp -r BlueSky-Clean-Dark ~/.themes
cp -r Dracula ~/.themes
cp -r Adwaita-dark ~/.themes
cp -r Nordic ~/.themes
cp -r Blackout ~/.themes
cp -r Graphite-Dark ~/.themes
cp -r Materia-Manjaro-gtk ~/.themes

cp -r Flat-Remix-Grey-Dark ~/.icons
cp -r Papirus ~/.icons
cp -r Papirus-Dark ~/.icons
cp -r Dracula-icons ~/.icons/
cp -r Sunity-cursors ~/.icons/

# --- Config files ---
cd ~/debian-z/
cp -r config/wallpapers/ ~/.config
cp -r config/i3/ ~/.config
cp -r config/scripts/ ~/.config
cp -r config/dunst/ ~/.config
cp -r config/rofi/ ~/.config
cp -r config/polybar/ ~/.config

# Optional configs kept:
cp config/guide.pdf ~/.config
cp config/bookmarks.txt ~/.config
cp config/.fehbg ~/

# Make scripts executable
chmod +x ~/.config/i3/autostart.sh
chmod +x ~/.config/i3/scripts/*

# --- GTK themes ---
mkdir -p ~/.config/gtk-3.0
cp config/settings.ini ~/.config/gtk-3.0/
cp config/.gtkrc-2.0 ~/

# --- Fix volume keys ---
xbindkeys --defaults > ~/.xbindkeysrc

cat >> ~/.xbindkeysrc << 'EOF'
# Increase volume
"amixer set Master 2%+"
   XF86AudioRaiseVolume

# Decrease volume
"amixer set Master 2%-"
   XF86AudioLowerVolume

# Mute volume
"amixer set Master toggle"
   XF86AudioMute
EOF

xbindkeys -f ~/.xbindkeysrc

echo "✨ Rice installed! (no neofetch/ufetch/nvim bloat)"
