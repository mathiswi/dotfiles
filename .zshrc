# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="agnoster"

DEFAULT_USER="mathis"

ENABLE_CORRECTION="true"

## merge Xresources, useful for urxvt & rofi theming

plugins=(
  git
)

source $ZSH/oh-my-zsh.sh


# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias loadnvm=". $HOME/.nvm/nvm.sh"
alias merge="xrdb merge ~/.config/.Xresources"
alias reload_bspwm="~/.config/bspwm/bspwmrc"
alias bspwmrc="code ~/.config/bspwm/bspwmrc"

# sdo() sudo zsh -c "$functions[$1]" "$@"

# change_wallpaper() {
#   sed -i '$d' ~/.config/bspwm/bspwmrc ;
#   echo "feh --bg-fill $1 &" > ~/.config/bspwm/bspwmrc ;
#   reload_bspwm
# }

# new() {
#   sed -i '$d' ~/.config/bspwm/bspwmrc &&
#   echo "feh --bg-fill $1 &" > ~/.config/bspwm/bspwmrc &&
#   reload_bspwm &&
#   cp $1 /etc/lightdm/wallpaper/wallpaper.jpg &&
#   sed -i '$ d' /etc/lightdm/slick-greeter.conf &&
#   echo "background = /etc/lightdm/wallpaper/wallpaper.jpg" > /etc/lightdm/slick-greeter.conf
# }