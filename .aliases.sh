##################################################################
# DOT Files                                                      #
##################################################################

alias dotcfg='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias zshcfg='nvim ~/.zshrc'
alias aliascfg='nvim ~/.aliases.sh'
alias reload='source ~/.zshrc'

##################################################################
# Scala                                                          #
##################################################################

findscala () {
  grep -r --include \*.scala $1 .
}

publish () {
  echo "Compiling & publishing $1"
  (cd "$ORGVUE_API/lib/$1" && sbt compile publishLocal)
  echo "Done."
}
compdef '_files -W "$ORGVUE_API/lib"' publish  

ci () {
  (cd "$ORGVUE_API/lib/$1" && sbt $(cat SBT-CI))
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

function patchBranch () {
  git diff "$1" -- "$2" > temp.patch
  git add -p temp.patch
  rm -f temp.patch
}

##################################################################
# General                                                        #
##################################################################

alias orgvue='cd /Users/sean.mcgroarty/code/orgvue-api'
alias crontab="VIM_CRONTAB=true crontab"

intelli () {
  if [ -z "$1" ]; then
    echo "specify a lib or app u dope"
  elif [[ "$1" == "." ]]; 
  then
    open -a IntelliJ\ IDEA\ CE .
  elif [ -d "$ORGVUE_API/app/$1" ];
  then
    open -a IntelliJ\ IDEA\ CE "$ORGVUE_API/app/$1"
  elif [ -d "$ORGVUE_API/lib/$1" ];
  then
    open -a IntelliJ\ IDEA\ CE "$ORGVUE_API/lib/$1"
  else
    echo "OI! $1 was not found in libs or apps"
  fi
}
compdef '_files -W "$ORGVUE_API/lib" "ORGVUE_API/app"' intelli  

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

function publishHttp4d() {
  echo "hello"
  x=$(read -s -p "Password: " pass)
  echo "$x"
  docker run -it --entrypoint=/bin/bash -e ARTIFACTORY_PASS="$pass" -v ~/code/http4s-directives:/home/app/vsts -v ~/code/orgvue-api-docker/orgvue-dev-ubuntu/sbt/credentials.hush:/home/app/.ivy2/.credentials orgvueapidevelop.azurecr.io/orgvue-dev-ubuntu-sbt:0.3.8 -c "cd /home/app/vsts/ && sed -i -e s/***/$ARTIFACTORY_PASS/ && sbt -Dsbt.boot.credentials=/home/app/.ivy2/.credentials -Dsbt.override.build.repos=true -Dsbt.repository.config=/home/app/.sbt/repositories test publish"

}

function docker-ip(){
  docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' "$1"
}

##################################################################
# InfluxDB                                                       #
##################################################################

alias ifdbstart='influxd -config /usr/local/etc/influxdb.conf'

