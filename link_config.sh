$DOT_DIR=$HOME/dotfiles
$
link_config() {
  echo -e $'\n### Linking Config ###\n'
  ln -sv $DOT_DIR/i3 ~/.config
  ln -sv $DOT_DIR/colorschemes ~/.config
  ln -sv $DOT_DIR/networkmanager-dmenu ~/.config
  ln -sv $DOT_DIR/polybar ~/.config
  ln -sv $DOT_DIR/rofi ~/.config
  ln -sv $DOT_DIR/wallpaper ~/.config
  ln -sv $DOT_DIR/greenclip.toml ~/.config
  ln -sv $DOT_DIR/picom.conf ~/.config
  ln -sv $DOT_DIR/.Xresources ~/.config
  ln -sv $DOT_DIR/dunst ~/.config
  ln -sv $DOT_DIR/.xbindkeysrc ~/
  ln -sv $DOT_DIR/.zshrc ~/
}

link_config
