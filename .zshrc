setopt HIST_IGNORE_ALL_DUPS

SPACESHIP_USER_SHOW="ssh"
SPACESHIP_HOST_SHOW="ssh"
SPACESHIP_USER_SUFFIX=" ➜  "
SPACESHIP_USER_COLOR="cyan"
SPACESHIP_CHAR_SYMBOL="λ "
SPACESHIP_DIR_PREFIX=""
ZSH_THEME="spaceship"
ZSH_DISABLE_COMPFIX=true

plugins=(git zsh-syntax-highlighting)

# STARTUP COMMANDS
source $ZSH/oh-my-zsh.sh
source $HOME/.aliases.sh

export PATH="$HOME/code/orgvue-api-docker/bin:$PATH"

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

intro='
$$\      $$\           $$\                                                   $$\      $$\                       $$\                         
$$ | $\  $$ |          $$ |                                                  $$$\    $$$ |                      $$ |                        
$$ |$$$\ $$ | $$$$$$\  $$ | $$$$$$$\  $$$$$$\  $$$$$$\$$$$\   $$$$$$\        $$$$\  $$$$ | $$$$$$\   $$$$$$$\ $$$$$$\    $$$$$$\   $$$$$$\  
$$ $$ $$\$$ |$$  __$$\ $$ |$$  _____|$$  __$$\ $$  _$$  _$$\ $$  __$$\       $$\$$\$$ $$ | \____$$\ $$  _____|\_$$  _|  $$  __$$\ $$  __$$\ 
$$$$  _$$$$ |$$$$$$$$ |$$ |$$ /      $$ /  $$ |$$ / $$ / $$ |$$$$$$$$ |      $$ \$$$  $$ | $$$$$$$ |\$$$$$$\    $$ |    $$$$$$$$ |$$ |  \__|
$$$  / \$$$ |$$   ____|$$ |$$ |      $$ |  $$ |$$ | $$ | $$ |$$   ____|      $$ |\$  /$$ |$$  __$$ | \____$$\   $$ |$$\ $$   ____|$$ |      
$$  /   \$$ |\$$$$$$$\ $$ |\$$$$$$$\ \$$$$$$  |$$ | $$ | $$ |\$$$$$$$\       $$ | \_/ $$ |\$$$$$$$ |$$$$$$$  |  \$$$$  |\$$$$$$$\ $$ |      
\__/     \__| \_______|\__| \_______| \______/ \__| \__| \__| \_______|      \__|     \__| \_______|\_______/    \____/  \_______|\__|      
                                                                                                                                            
'
text=$'\e[1;32m'
if [[ $(tput cols) -gt "200" && $(tput lines) -gt "8" ]]; then  
  printf "%s\n" "${text}$intro${text}"
fi
