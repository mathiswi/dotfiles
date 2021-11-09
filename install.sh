#!/usr/bin/env bash


init() {
  echo -e "Creating Projects folder if it doesn't already exist"
  mkdir -p ~/Projects
  echo -e "Removing .Xresources in home directory"
  rm ~/.Xresources
  rm -rf ~/.config/i3
}

install_packages() {
  echo -e $'\n### Installing packages ###\n'
  # Package manager
  pacman -S yay --noconfirm
  # Application launcher & several other menus
  yay -S rofi --noconfirm
  # zsh
  yay -S zsh --noconfirm
  # Clipboard manager
  yay -S rofi-greenclip --noconfirm
  # Status bar
  yay -S polybar --noconfirm
  # Code editor
  yay -S visual-studio-code-bin --noconfirm
  # Editor font
  yay -S ttf-fira-code --noconfirm
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
  # notification deamon
  yay -S dunst --noconfirm
  # urxvt terminal
  yay -S rxvt-unicode --noconfirm 
  # scroll tool for spotify polybar
  yay -S zscroll --noconfirm
  # lockscreen
  yay -S betterlockscreen --noconfirm
  # bluetooth manager
  yay -S blueman --noconfirm
  # brightness manager
  yay -S brightnessctl --noconfirm
  # clipboard for screenshots
  yay -S xclip --noconfirm
  # gnome keyring for vscode
  yay -S gnome-keyring --noconfirm
}


enable_services() {
  systemctl --user enable greenclip.service 
  systemctl --user start greenclip.service 
}

misc() {
  echo -e $'\n### Misc ###\n'
  # Set wallpaper of lockscreen
  betterlockscreen -u ~/.config/wallpaper/wallpaper.* 
  # merge .Xresources
  xrdb merge ~/.config/.Xresources
  # restart i3
  i3-msg restart

}

init_zsh() {
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
}

install_fonts() {
  FDIR="$HOME/.local/share/fonts"
	echo -e $'\n### Installing Fonts ###\n'
	if [[ -d "$FDIR" ]]; then
		cp -rf $DIR/fonts/* "$FDIR"
	else
		mkdir -p "$FDIR"
		cp -rf ./fonts/* "$FDIR"
	fi
}


init
install_packages
misc
install_fonts
enable_services
init_zsh
