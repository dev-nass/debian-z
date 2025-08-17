#!/bin/bash

# --- Safer Rice Installer (Cinnamon-friendly) ---
set -e

cd ~
mkdir -p ~/.themes
mkdir -p ~/.icons
mkdir -p ~/.config

# --- Extract themes/icons ---
cd ~/debian-z/theme

tar -xf BlueSky-Clean-Dark.tar.xz
tar -xf Sunity-cursors.tar.gz
tar -xf Adwaita-dark.tar
tar -xf Papirus-gray.tar.xz
tar -xf Graphite-Dark.tar.xz
tar -xzf Materia-Manjaro-gtk.tar.gz
unzip -o Nordic.zip
unzip -o Blackout.zip
unzip -o Flat-Remix-Grey-Dark.zip
tar -xzf Dracula.tar.gz
tar -xzf Dracula-icons.tar.gz

# --- Move to ~/.themes & ~/.icons ---
cp -r BlueSky-Clean-Dark ~/.themes/
cp -r Dracula ~/.themes/
cp -r Adwaita-dark ~/.themes/
cp -r Nordic ~/.themes/
cp -r Blackout ~/.themes/
cp -r Graphite-Dark ~/.themes/
cp -r Materia-Manjaro-gtk ~/.themes/

cp -r Flat-Remix-Grey-Dark ~/.icons/
cp -r Papirus ~/.icons/ || true
cp -r Papirus-Dark ~/.icons/ || true
cp -r Dracula-icons ~/.icons/
cp -r Sunity-cursors ~/.icons/

# --- Config files (safe copy) ---
cd ~/debian-z/

cp -r config/wallpapers ~/.config/ 2>/dev/null || true
cp -r config/i3 ~/.config/ 2>/dev/null || true
cp -r config/scripts ~/.config/ 2>/dev/null || true
cp -r config/dunst ~/.config/ 2>/dev/null || true
cp -r config/rofi ~/.config/ 2>/dev/null || true
cp -r config/polybar ~/.config/ 2>/dev/null || true

cp config/guide.pdf ~/.config/ 2>/dev/null || true
cp config/bookmarks.txt ~/.config/ 2>/dev/null || true
cp config/.fehbg ~/ 2>/dev/null || true

# Make scripts executable (only if they exist)
[ -f ~/.config/i3/autostart.sh ] && chmod +x ~/.config/i3/autostart.sh
[ -d ~/.config/i3/scripts ] && chmod +x ~/.config/i3/scripts/* || true

# --- GTK Themes ---
mkdir -p ~/.config/gtk-3.0
cp config/settings.ini ~/.config/gtk-3.0/ 2>/dev/null || true
cp config/.gtkrc-2.0 ~/ 2>/dev/null || true

# --- Fix volume keys (only if xbindkeys is installed) ---
if command -v xbindkeys >/dev/null 2>&1; then
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
else
    echo "⚠️ xbindkeys not installed — skipping volume key setup"
fi

echo "✨ Rice installed (Cinnamon-safe, minimal bloat)"
