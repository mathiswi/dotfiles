#!/usr/bin/env bash

DIR=$HOME/dotfiles/

init() {
  echo -e "Creating Projects folder if it doesn't already exist"
  mkdir -p ~/Projects
  echo -e "Removing .Xresources in home directory"
  rm ~/.Xresources
  echo -e "Removing old i3-config in home directory"

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
  # Browser
  yay -S firefox-developer-edition --noconfirm
  # notification deamon
  yay -S dunst --noconfirm
  # urxvt terminal
  yay -S rxvt-unicode --noconfirm 
  # gnome keyring for vscode
  yay -S gnome-keyring --noconfirm
  # Fibonacci Layouting
  #yay -S python-i3ipc --noconfirm
  #yay -S alternating-layouts-git --noconfirm
  # Github CLI
  yay -S github-cli --noconfirm
}


enable_services() {
  systemctl --user enable greenclip.service 
  systemctl --user start greenclip.service 
}

misc() {
  echo -e $'\n### Misc ###\n'
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
  mkdir -p $FDIR
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

