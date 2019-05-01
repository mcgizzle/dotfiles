export ZSH="$HOME/.oh-my-zsh"
export EDITOR=/usr/local/bin/nvim
export SPACESHIP_CHAR_SYMBOL="λ "

setopt HIST_IGNORE_ALL_DUPS

ZSH_THEME="spaceship"
ZSH_DISABLE_COMPFIX=true

plugins=(git)

# STARTUP COMMANDS
source $ZSH/oh-my-zsh.sh
# Source .aliases.sh on startup
source $HOME/.aliases.sh
#Source AWS keys
source $HOME/.aws/orgvue-creds

eval $(thefuck --alias)

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

