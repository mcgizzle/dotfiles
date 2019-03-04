export ZSH="$HOME/.oh-my-zsh"
export EDITOR=/usr/local/bin/nvim
ZSH_THEME="spaceship"
ZSH_DISABLE_COMPFIX=true

plugins=(git)

source $ZSH/oh-my-zsh.sh

source $HOME/.aliases.sh

alias crontab="VIM_CRONTAB=true crontab"
eval $(thefuck --alias)

autoload -U add-zsh-hook
load-local-conf() {
     # check file exists, is regular file and is readable:
     if [[ -f .aliases.sh && -r .aliases.sh ]]; then
       source .aliases.sh
     fi
}
add-zsh-hook chpwd load-local-conf

eval $(thefuck --alias)
