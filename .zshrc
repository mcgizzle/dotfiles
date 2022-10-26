setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE        
setopt BANG_HIST                 
setopt INC_APPEND_HISTORY        
setopt SHARE_HISTORY             
setopt HIST_EXPIRE_DUPS_FIRST   
setopt HIST_IGNORE_DUPS        
setopt HIST_IGNORE_ALL_DUPS    
setopt HIST_FIND_NO_DUPS      
setopt HIST_IGNORE_SPACE     
setopt HIST_SAVE_NO_DUPS    
setopt HIST_REDUCE_BLANKS  
setopt HIST_VERIFY         
setopt HIST_BEEP       
unsetopt BEEP

HISTSIZE=10000000
SAVEHIST=10000000
export HISTFILE="$HOME/.history"
export SAVEHIST=$HISTSIZE

SPACESHIP_KUBECTL_SHOW=true
SPACESHIP_KUBECONTEXT_SHOW=true
SPACESHIP_KUBECTL_VERSION_SHOW=false
SPACESHIP_USER_SHOW="ssh"
SPACESHIP_HOST_SHOW="ssh"
SPACESHIP_USER_SUFFIX=" ➜  "
SPACESHIP_USER_COLOR="cyan"
SPACESHIP_CHAR_SYMBOL="λ "
SPACESHIP_DIR_PREFIX=""
SPACESHIP_DIR_COLOR="147"
ZSH_THEME="spaceship"
ZSH_DISABLE_COMPFIX=true
DRACULA_ARROW_ICON="λ"

SPACESHIP_GIT_STATUS_COLOR="green"

plugins=(
  git 
  zsh-syntax-highlighting 
  docker 
  docker-compose 
  kubetail
)

# STARTUP COMMANDS
source $ZSH/oh-my-zsh.sh
source $HOME/.aliases.sh
if [ -f $HOME/.zshenv.hu.sh ]; then
  source $HOME/.zshenv.hu.sh
fi

alias pi="ssh pi@$PI_LOCAL"

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

source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
