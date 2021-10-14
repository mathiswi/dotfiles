
link_config() {
  echo -e $'\n### Linking Config ###\n'
  ln -sv ~/dotfiles/i3 ~/.config/
  ln -sv ~/dotfiles/colorschemes ~/.config/
  ln -sv ~/dotfiles/networkmanager-dmenu ~/.config/
  ln -sv ~/dotfiles/polybar ~/.config/
  ln -sv ~/dotfiles/rofi ~/.config/
  ln -sv ~/dotfiles/wallpaper ~/.config/
  ln -sv ~/dotfiles/greenclip.toml ~/.config/
  ln -sv ~/dotfiles/picom.conf ~/.config/
  ln -sv ~/dotfiles/.Xresources ~/.config/
  ln -sv ~/dotfiles/dunst ~/.config/
  ln -sv ~/dotfiles/.xbindkeysrc ~/
  ln -sv ~/dotfiles/.zshrc ~/
}

link_config
