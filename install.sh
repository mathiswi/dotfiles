#!/usr/bin/env bash

sudo pacman -S -y --noconfirm yay inotify-tools bc && 

echo "Copying.." &&
cp -r bspwm colorschemes networkmanager-dmenu polybar rofi sxhkd wallpaper greenclip.cfg picom.conf .Xresources ~/.config/ &&
sudo cp greenclip.service /usr/lib/systemd/user/ && 
systemctl --user enable greenclip.service && 
systemctl --user start greenclip.service && 
echo "Installing ..." &&
yay -S rofi polybar firefox-developer-edition playerctl otf-fira-code visual-studio-code-bin rofi-greenclip spotify thunderbird betterlockscreen nerd-fonts-source-code-pro ttf-iosevka -y --noconfirm && 
# Backlight Functionality for OLED screens
sudo cp xbacklightmon /usr/local/bin &&
sudo chown root:root /usr/local/bin/xbacklightmon &&
sudo chmod 755 /usr/local/bin/xbacklightmon &&
sudo cp xbacklightmon.service /usr/lib/systemd/user &&
systemctl --user enable xbacklightmon.service &&
systemctl --user start xbacklightmon.service &&
xbacklight +50 &&
# Misc 
betterlockscreen -u ~/.config/wallpaper/wallpaper.jpg &&
rm ~/.Xresources &&
xrdb merge ~/.config/.Xresources &&
~/.config/bspwm/bspwmrc &&
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" &
cp .zshrc .xbindkeysrc ~/ &&
# Spotify on 4k Screen
sudo cp spotify.desktop /usr/share/applications/
echo "Done!"

