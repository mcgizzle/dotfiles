setopt HIST_IGNORE_ALL_DUPS

export SPACESHIP_CHAR_SYMBOL="λ "
ZSH_THEME="spaceship"
ZSH_DISABLE_COMPFIX=true

plugins=(git zsh-syntax-highlighting)

# STARTUP COMMANDS
source $ZSH/oh-my-zsh.sh
source $HOME/.aliases.sh

eval $(thefuck --alias)
eval "$(direnv hook zsh)"

# Load .aliases.sh on cd into directory
autoload -U add-zsh-hook
load-local-conf() {
     # check file exists, is regular file and is readable:
     if [[ -f .aliases.sh && -r .aliases.sh ]]; then
       source .aliases.sh
     fi
}
add-zsh-hook chpwd load-local-conf
load-local-conf

lookAway () {
  while true; do
    osascript -e 'display notification "Look away from the screen!!" with title "Hello there" sound name "hero"'
    sleep 1200 
  done & 
}

