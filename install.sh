#!/usr/bin/env bash

sudo pacman -S -y --noconfirm yay inotify-tools bc && 

init() {
  echo "Creating Projects folder if it doesn't already exist"
  mkdir -p ~/Projects
  echo "Removing .Xresources in home directory"
  rm ~/.Xresources
}

install_packages() {
  echo "Installing packages"
  # Package manager
  pacman -S yay --noconfirm
  # Application launcher & several other menus
  yay -S rofi --noconfirm
  # Clipboard manager
  yay -S rofi-greenclip --noconfirm
  # Status bar
  yay -S polybar --noconfirm
  # Code editor
  yay -S visual-studio-code-bin --noconfirm
  # Editor font
  yay -S otf-fira-code --noconfirm
  # Browser
  yay -S firefox-developer-edition --noconfirm
  # Media controls
  yay -S playerctl --noconfirm
  # music player
  yay -S spotify --noconfirm
  # lockscreen
  yay -S betterlockscreen --noconfirm
  # icon fonts
  yay -S nerd-fonts-source-code-pro --noconfirm
  # terminal font
  yay -S ttf-iosevka --noconfirm
  # spotify customization
  yay -S spicetify-cli spicetify-themes-git --noconfirm
}

link_config() {
  ln -sv ~/Projects/dotfiles/bspwm ~/.config
  ln -sv ~/Projects/dotfiles/colorschemes ~/.config
  ln -sv ~/Projects/dotfiles/networkmanager-dmenu ~/.config
  ln -sv ~/Projects/dotfiles/polybar ~/.config
  ln -sv ~/Projects/dotfiles/rofi ~/.config
  ln -sv ~/Projects/dotfiles/sxhkd ~/.config
  ln -sv ~/Projects/dotfiles/wallpaper ~/.config
  ln -sv ~/Projects/dotfiles/greenclip.cfg ~/.config
  ln -sv ~/Projects/dotfiles/picom.conf ~/.config
  ln -sv ~/Projects/dotfiles/.Xresources ~/.config
  ln -sv ~/Projects/dotfiles/.zshrc ~/
  ln -sv ~/Projects/dotfiles/.xbindkeysrc ~/
}

enable_services() {
  systemctl --user enable greenclip.service 
  systemctl --user start greenclip.service 
}

misc() {
  # Set wallpaper of lockscreen
  betterlockscreen -u ~/.config/wallpaper/wallpaper.jpg &&
  # merge .Xresources
  xrdb merge ~/.config/.Xresources
  # restart bspwmrc
  ~/.config/bspwm/bspwmrc
  # copy spotify desktop file (4k screen resolution fix)
  cp spotify.desktop /usr/share/applications/
}

init_zsh() {
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" &
  cp .zshrc 
}

# Fix for backlight control for OLED Panel
backlight_fix() {
  pacman -S inotify-tools bc
  cp xbacklightmon /usr/local/bin 
  chown root:root /usr/local/bin/xbacklightmon 
  chmod 755 /usr/local/bin/xbacklightmon 
  cp xbacklightmon.service /usr/lib/systemd/user 
  systemctl enable xbacklightmon.service 
  systemctl start xbacklightmon.service 
  xbacklight +50 
}

init
install_packages
link_config
misc
backlight_fix
init_zsh