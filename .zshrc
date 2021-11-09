# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="agnoster"

DEFAULT_USER="mathis"

ENABLE_CORRECTION="false"

## merge Xresources, useful for urxvt & rofi theming

plugins=(
  git
)

eval "$(starship init zsh)"

alias loadnvm=". $HOME/.nvm/nvm.sh"
alias merge="xrdb merge ~/.config/.Xresources"


export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export BROWSER=firefox-developer-edition

# Added by serverless binary installer
export PATH="$HOME/.serverless/bin:$PATH"
