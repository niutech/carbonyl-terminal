#!/bin/sh
cp carbonyl_rsa ~/.ssh/
chmod 600 ~/.ssh/carbonyl_rsa
[ -x "$(command -v qterminal)" ] || sudo apt install qterminal || sudo zypper install qterminal || sudo dnf install qterminal || sudo pacman -S qterminal || sudo port install qterminal || echo Please install qterminal package
mkdir -p ~/.config/qterminal.org ~/.icons ~/.local/share/applications
cp qterminal.ini ~/.config/qterminal.org/
cp carbonyl.png ~/.icons/
desktop-file-install --dir=$HOME/.local/share/applications carbonyl-terminal.desktop && update-desktop-database ~/.local/share/applications
