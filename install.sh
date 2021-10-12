#!/usr/bin/env bash


init() {
  echo "Creating Projects folder if it doesn't already exist"
  mkdir -p ~/Projects
  echo "Removing .Xresources in home directory"
  rm ~/.Xresources
}

install_packages() {
  echo $'\n### Installing packages ###\n'
  # Package manager
  pacman -S yay --noconfirm
  # Application launcher & several other menus
  yay -S rofi --noconfirm
  # i3-gaps-next
  yay -S i3-gaps-next-git --noconfirm
  # zsh
  yay -S zsh --noconfirm
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
  # yay -S nerd-fonts-source-code-pro --noconfirm
  # terminal font
  yay -S ttf-iosevka --noconfirm
  # spotify customization
  yay -S spicetify-cli spicetify-themes-git --noconfirm
}

link_config() {
  echo $'\n### Linking Config ###\n'
  ln -sv ~/dotfiles/i3 ~/.config
  ln -sv ~/dotfiles/colorschemes ~/.config
  ln -sv ~/dotfiles/networkmanager-dmenu ~/.config
  ln -sv ~/dotfiles/polybar ~/.config
  ln -sv ~/dotfiles/rofi ~/.config
  ln -sv ~/dotfiles/wallpaper ~/.config
  ln -sv ~/dotfiles/greenclip.cfg ~/.config
  ln -sv ~/dotfiles/picom.conf ~/.config
  ln -sv ~/dotfiles/.Xresources ~/.config
  ln -sv ~/dotfiles/.zshrc ~/
  ln -sv ~/dotfiles/.xbindkeysrc ~/
}

enable_services() {
  systemctl --user enable greenclip.service 
  systemctl --user start greenclip.service 
}

misc() {
  echo $'\n### Misc ###\n'
  # Set wallpaper of lockscreen
  betterlockscreen -u ~/.config/wallpaper/wallpaper.* 
  # merge .Xresources
  xrdb merge ~/.config/.Xresources
  # restart i3
  i3-msg restart
  # copy spotify desktop file (4k screen resolution fix)
  sudo cp spotify.desktop /usr/share/applications/
}

init_zsh() {
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" &
  cp .zshrc ~/
}

# Fix for backlight control for OLED Panel
backlight_fix() {
  echo $'\n### Fixing Backlight ###\n'
  sudo pacman -S inotify-tools bc --noconfirm
  sudo cp xbacklightmon /usr/local/bin 
  sudo chown root:root /usr/local/bin/xbacklightmon 
  sudo chmod 755 /usr/local/bin/xbacklightmon 
  sudo cp xbacklightmon.service /usr/lib/systemd/user 
  systemctl --user enable --now xbacklightmon.service 
  xbacklight +50 
}

init
install_packages
link_config
misc
# backlight_fix
init_zsh
