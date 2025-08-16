#!/bin/bash

# Update User Directories (Documents, Downloads, etc.)
xdg-user-dirs-update

# --- Installing i3-gaps ---
cd ~/Downloads
git clone https://github.com/Airblader/i3 i3-gaps
cd i3-gaps
mkdir -p build && cd build
meson --prefix /usr/local
ninja
sudo ninja install

# --- Configure xsessions (so i3 shows up in LightDM session list) ---
if [[ ! -d /usr/share/xsessions ]]; then
    sudo mkdir /usr/share/xsessions
fi

cat > ./temp << "EOF"
[Desktop Entry]
Encoding=UTF-8
Name=i3
Comment=Tiling Window Manager (i3-gaps)
Exec=i3
Icon=i3
Type=XSession
EOF

sudo cp ./temp /usr/share/xsessions/i3.desktop
rm ./temp
