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

export HISTFILE="$HOME/.history"
export SAVEHIST=10000000

ZSH_DISABLE_COMPFIX=true


# STARTUP COMMANDS
source $ZSH/oh-my-zsh.sh
source $HOME/.aliases.sh
if [ -f $HOME/.zshenv.hu.sh ]; then
  source $HOME/.zshenv.hu.sh
fi

if [[ "$OSTYPE" == "darwin"* ]]; then
  source "$HOME/.darwin.sh"
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
  source "$HOME/.debian.sh"
else
  "Unknown OS $OSTYPE"
fi

source $HOME/.intro.sh
