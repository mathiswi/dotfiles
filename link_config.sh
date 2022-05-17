
link_config() {
  echo -e $'\n### Linking Config ###\n'
  rm -rf /~/.config/i3
  ln -sv ~/dotfiles/i3 ~/.config/
  rm -rf /~/.config/colorschemes
  ln -sv ~/dotfiles/colorschemes ~/.config/
  rm -rf /~/.config/polybar
  ln -sv ~/dotfiles/polybar ~/.config/
  rm -rf /~/.config/rofi
  ln -sv ~/dotfiles/rofi ~/.config/
  rm -rf /~/.config/wallpaper
  ln -sv ~/dotfiles/wallpaper ~/.config/
  rm /~/.config/greenclip.toml
  ln -sv ~/dotfiles/greenclip.toml ~/.config/
  ln -sv ~/dotfiles/.Xresources ~/.config/
  rm -rf /~/.config/dunst
  ln -sv ~/dotfiles/dunst ~/.config/
  rm ~/.zshrc
  ln -sv ~/dotfiles/.zshrc ~/
}

link_config
xrdb merge ~/.config/.Xresources
