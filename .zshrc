export ZSH="$HOME/.oh-my-zsh"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.stack/programs/x86_64-osx/ghc-8.2.2/bin:$PATH"
export EDITOR=/usr/local/bin/nvim
ZSH_THEME="spaceship"

plugins=(git)

source $ZSH/oh-my-zsh.sh

source $HOME/.aliases.sh

alias crontab="VIM_CRONTAB=true crontab"

autoload -U add-zsh-hook
load-local-conf() {
     # check file exists, is regular file and is readable:
     if [[ -f .aliases.sh && -r .aliases.sh ]]; then
       source .aliases.sh
     fi
}
add-zsh-hook chpwd load-local-conf
