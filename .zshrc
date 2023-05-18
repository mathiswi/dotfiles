# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/mathis/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes

ZSH_THEME="agnoster"

DEFAULT_USER="mathis"

ENABLE_CORRECTION="false"

export NVM_LAZY_LOAD=true
export NVM_COMPLETION=true

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  zsh-nvm
  git
  sudo
)

source $ZSH/oh-my-zsh.sh

# User configuration


alias loadnvm=". $HOME/.nvm/nvm.sh"
alias merge="xrdb merge ~/.config/.Xresources"
alias reload_polybar="~/.config/polybar/launch.sh &"


# export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export BROWSER=firefox-developer-edition
#export NODE_OPTIONS=--openssl-legacy-provider

# Added by serverless binary installer
export PATH="$HOME/.serverless/bin:$PATH"
export PATH="/usr/local/bin/:$PATH"
export PATH="$HOME/bin/:$PATH"

timezsh() {
  shell=${1-$SHELL}
  for i in $(seq 1 10); do /usr/bin/time $shell -i -c exit; done
}

reload_monitors() {
  ~/.screenlayout/reset.sh
  sleep 3
  ~/.screenlayout/home.sh
  reload_polybar
}

autoload bashcompinit && bashcompinit
autoload -Uz compinit && compinit
autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/bin/terraform terraform
