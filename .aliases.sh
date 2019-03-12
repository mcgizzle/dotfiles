ORGVUE_API="$HOME/code/orgvue-api"
# Vim
alias vim='nvim'
# DOT Files ------------------------------------------------------
alias dotcfg='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias zshcfg='nvim ~/.zshrc'
alias aliascfg='nvim ~/.aliases.sh'
alias reload='source ~/.zshrc'
# ----------------------------------------------------------------
# Scala ----------------------------------------------------------
findscala () {
  grep -r --include \*.scala $1 .
}
publish () {
  echo "Compiling & publishing $1"
  (cd "$ORGVUE_API/lib/$1" && sbt compile publishLocal)
  echo "Done."
}
# GIT -----------------------------------------------------------
alias g='git'
alias gs='git status'

patchBranch () {
  git diff "$1" -- "$2" > temp.patch
  git add -p temp.patch
  rm -f temp.patch
}

# General -------------------------------------------------------

intelli () {
  if [ -d "$ORGVUE_API/app/$1" ]; then
    open -a IntelliJ\ IDEA\ CE "$ORGVUE_API/app/$1"
  elif [ -d "$ORGVUE_API/lib/$1" ] 
  then
    open -a IntelliJ\ IDEA\ CE "$ORGVUE_API/lib/$1"
  else
    echo "OI! $1 was not found in libs or apps"
  fi
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

function sw () {
   "!!:gs/$1/$2/"
}
# Postgres -------------------------------------------------------
alias pgstart='pg_ctl -D /usr/local/var/postgres start'
alias pgstop='pg_ctl -D /usr/local/var/postgres stop'
#-----------------------------------------------------------------
# InfluxDB -------------------------------------------------------
alias ifdbstart='influxd -config /usr/local/etc/influxdb.conf'
#-----------------------------------------------------------------
# Google ---------------------------------------------------------
function gsearch () {
  echo "Searching The Google"
  open http://google.com/search\?q\=$1
}
#-----------------------------------------------------------------
# Vim ------------------------------------------------------------
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
#-----------------------------------------------------------------
# Docker  --------------------------------------------------------
function docker-ip(){
  docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' "$1"
}
#-----------------------------------------------------------------
