##################################################################
# DOT Files                                                      #
##################################################################

alias dotcfg='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias zshcfg='nvim ~/.zshrc'
alias aliascfg='nvim ~/.aliases.sh'
alias envcfg='nvim ~/.zshenv'
alias reload='source ~/.zshrc'

alias vpn='networksetup -connectpppoeservice "Concentra VPN"'

##################################################################
# HCM                                                            #
##################################################################

alias hcm='cd $HOME/code/hcm'
alias hcmb='cd $HOME/code/hcm/hcm-backend'
alias hcma='cd $HOME/code/hcm/hcm-admin'
alias hcmf='cd $HOME/code/hcm/hcm-frontend'

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
  git pull origin $1
}

function gco () {
  git checkout "$1"
}

function gcr () {
  git clone --recursive "$@"
}
##################################################################
# General                                                        #
##################################################################

alias dir="basename $PWD"

trash () {
  mv $1 $HOME/.Trash
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

function sr () {

  find "$3" -name "$4" | while read line; do

    echo "Working on $line"           

    temp="$line.tmp"
 
    sed -e "s/$1/$2/g" $line > $temp 

    mv $temp "$line"

  done
}  

function gsearch () {
  echo "Searching The Google"
  open http://google.com/search\?q\=$1
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
function cfg(){
        if [ -z "$1" ]
        then
          echo "Specify nvim/vim"
        elif [ "$1" = "vim" ]
        then
          echo "open"
          vim ~/.vimrc
        elif [ "$1" = "nvim" ]
        then
          nvim ~/.config/nvim/init.vim
        else
          echo "Options are: nvim/vim"
        fi
      }

##################################################################
# Docker                                                         #
##################################################################

function docker-ip(){
  docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' "$1"
}

##################################################################
# InfluxDB                                                       #
##################################################################

alias ifdbstart='influxd -config /usr/local/etc/influxdb.conf'

