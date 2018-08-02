# DOT Files ------------------------------------------------------
alias dotcfg='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias zshcfg='vim ~/.zshrc'
alias aliascfg='vim ~/.aliases.sh'
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
# FYP Stack ----------------------------------------------------------
alias stacknet='/Users/McGroarty/College/FYP/stack-network/.stack-work/install/x86_64-osx/lts-9.14/8.0.2/bin/stack-network'
alias mstack='/Users/McGroarty/College/FYP/stack/.stack-work/install/x86_64-osx/lts-9.14/8.0.2/bin/stack'
alias mdstack='/Users/McGroarty/College/FYP/stack/.stack-work/install/x86_64-linux-dkda49f7ca9b244180d3cfb1987cbc9743/lts-9.14/8.0.2/bin/stack'
alias mdworker='/Users/McGroarty/College/FYP/stack/.stack-work/install/x86_64-linux-dkda49f7ca9b244180d3cfb1987cbc9743/lts-9.14/8.0.2/bin/worker'
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
