# Vim
alias vim='nvim'
# DOT Files ------------------------------------------------------
alias dotcfg='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias zshcfg='nvim ~/.zshrc'
alias aliascfg='nvim ~/.aliases.sh'
alias reload='source ~/.zshrc'
# ----------------------------------------------------------------
# General --------------------------------------------------------
alias g='git'
alias coll='cd ~/College'
alias proj='cd ~/Projects'
alias scripts='cd ~/Scripts'
alias hcm='cd ~/Projects/HCM'
alias hcmf='cd ~/Projects/HCM/hcm-frontend'
alias hcmb='cd ~/Projects/HCM/hcm-backend'

vport () {
  lsof -i tcp:"$1"
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

function srhs () {
  
  sr $1 $2 $3 '*.hs'

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
#-----------------------------------------------------------------
# Google ---------------------------------------------------------
function gsearch () {
  echo "Searching The Google"
  open http://google.com/search\?q\=$1
}
#----------------------------------------------------------------
# Vim -----------------------------------------------------------
alias pathon='cd ~/.vim/bundle'
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
# ----------------------------------------------------------------
# SSH ------------------------------------------------------------
alias ssh-mcn='ssh mcgroas@macneill.scss.tcd.ie'
#-----------------------------------------------------------------
#-----------------------------------------------------------------
# Docker  --------------------------------------------------------
function docker-ip(){
  docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' "$1"
}
#-----------------------------------------------------------------
