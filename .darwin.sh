# Theme
ZSH_THEME="spaceship"

# Theme Settings
#SPACESHIP_GIT_STATUS_COLOR="green"
SPACESHIP_KUBECTL_CONTEXT_SHOW=true
SPACESHIP_KUBECTL_VERSION_SHOW=false
SPACESHIP_USER_SHOW="ssh"
SPACESHIP_HOST_SHOW="ssh"
SPACESHIP_USER_SUFFIX=" ➜  "
#SPACESHIP_USER_COLOR="cyan"
SPACESHIP_CHAR_SYMBOL="λ "
SPACESHIP_DIR_PREFIX=""
SPACESHIP_GCLOUD_SHOW=false
#SPACESHIP_DIR_COLOR="147"

# Plugins
plugins=(
  git 
  zsh-syntax-highlighting 
  docker 
  docker-compose 
  kubetail
)

fpath=(/opt/homebrew/share/zsh/site-functions $fpath)

source "$(brew --prefix)/share/google-cloud-sdk/completion.zsh.inc"
source "$(brew --prefix)/share/google-cloud-sdk/path.zsh.inc"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
eval "$(/opt/homebrew/bin/brew shellenv)"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval "$(rbenv init - --path)"
[[ $commands[kubectl] ]] && source <(kubectl completion zsh)

eval "$(jenv init -)"
