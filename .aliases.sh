##################################################################
# DOT Files                                                      #
##################################################################

alias dotcfg='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias zshcfg='nvim ~/.zshrc'
alias aliascfg='nvim ~/.aliases.sh'
alias envcfg='nvim ~/.zshenv'
alias reload='source ~/.zshrc'

##################################################################
# General                                                        #
##################################################################
alias dir='basename `PWD`'

trash () {
  mv "$1" "$HOME/.Trash"
}
vport () {
  lsof -i :"$1"
}

kpid () {
  kill -9 "$1"
}

ignore (){
  echo "$1" >> .gitignore
}

function cs(){
  cd $1;
  ls
}

##################################################################
# Scala                                                          #
##################################################################

intelli () {
  open -a IntelliJ\ IDEA\ CE "$HOME/code/$@"
}
compdef '_files -W "$HOME/code"' intelli

gpgSbt () {
  gpg --homedir . "$@"
}

findscala () {
  grep -r --include \*.scala $1 .
}

##################################################################
# Git Config                                                     #
##################################################################

alias gs='git status'
alias gfo='git fetch origin'
alias gpu='git push -u origin "$(git symbolic-ref --short HEAD)"'

function  gpl () {
  git pull origin "$1"
}

function gco () {
  git checkout "$1"
}

function gcr () {
  git clone --recursive "$@"
}
##################################################################
# Postgres                                                       #
##################################################################

alias pgstart='pg_ctl -D /usr/local/var/postgres start'
alias pgstop='pg_ctl -D /usr/local/var/postgres stop'
alias pgcount="psql -U postgres --dbname=OrgVue -Atc 'SELECT count(*) FROM pg_stat_activity'"

##################################################################
# Vim                                                            #
##################################################################

alias vim='nvim'
alias pathonv='cd ~/.config/nvim/bundle'
alias vimcfg='nvim ~/.config/nvim/init.vim'

##################################################################
# Kubernetes                                                     #
##################################################################

alias kctx=' kubectl config use-context '"$1"''

##################################################################
# Docker                                                         #
##################################################################

function docker-upf() {
  docker-compose up -d "$1" && docker-compose logs -f "$1"
}

function docker-stop() {
  docker stop $(docker ps | grep "$1" | cut -f 1 -d " ")
}
function docker-ip(){
  docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' "$1"
}

##################################################################
# HCM                                                            #
##################################################################

alias hcm='cd $HOME/code/hcm'
alias hcmb='cd $HOME/code/hcm/hcm-backend'
alias hcma='cd $HOME/code/hcm/hcm-admin'
alias hcmf='cd $HOME/code/hcm/hcm-frontend'

