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

ZSH_DISABLE_COMPFIX=true
DRACULA_ARROW_ICON="λ"

if [[ "$OSTYPE" == "darwin"* ]]; then
    ZSH_THEME="spaceship"
    SPACESHIP_GIT_STATUS_COLOR="green"
    SPACESHIP_KUBECTL_CONTEXT_SHOW=true
    SPACESHIP_KUBECTL_VERSION_SHOW=false
    SPACESHIP_USER_SHOW="ssh"
    SPACESHIP_HOST_SHOW="ssh"
    SPACESHIP_USER_SUFFIX=" ➜  "
    SPACESHIP_USER_COLOR="cyan"
    SPACESHIP_CHAR_SYMBOL="λ "
    SPACESHIP_DIR_PREFIX=""
    SPACESHIP_DIR_COLOR="147"
    # macOS specific plugins
    plugins=(
      git 
      zsh-syntax-highlighting 
      docker 
      docker-compose 
      kubetail
    )
    fpath=(/opt/homebrew/share/zsh/site-functions $fpath)
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    plugins=(
      git 
      zsh-syntax-highlighting 
      docker 
    )
fi

# STARTUP COMMANDS
source $ZSH/oh-my-zsh.sh
source $HOME/.aliases.sh
if [ -f $HOME/.zshenv.hu.sh ]; then
  source $HOME/.zshenv.hu.sh
fi

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

if [[ "$OSTYPE" == "darwin"* ]]; then
    # Source Google Cloud SDK completion script only on macOS
    source "/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
    eval "$(/opt/homebrew/bin/brew shellenv)"
    [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


    eval "$(rbenv init - --path)"
    [[ $commands[kubectl] ]] && source <(kubectl completion zsh)

    eval "$(jenv init -)"
fi

