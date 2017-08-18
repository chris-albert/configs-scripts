#!/bin/bash

export PS1="\[$(tput setaf 2)\]┌─\[$(tput setaf 1)\]\u\[$(tput setaf 3)\]@\[$(tput setaf 4)\]\h\[$(tput setaf 5)\]:\w\[$(tput setaf 3)\] #\! \[$(tput setaf 6)\][\t]\n\[$(tput setaf 2)\]└>\[$(tput sgr0)\]";
export PS2='-->'
export JAVA_OPTS="-Xmx3g -XX:MaxPermSize=512m -XX:+CMSClassUnloadingEnabled"

ulimit -n 65536 65536

alias d='docker'
alias c='docker-compose'
alias ls='ls -G'
alias chrome='open -a Google\ Chrome'
alias weather='curl http://wttr.in/san_francisco'
alias activator=/Users/chrisalbert/opt/activator-1.3.5-minimal/activator
alias mysql.server=/usr/local/mysql/support-files/mysql.server
alias nombom='npm cache clear && bower cache clean && rm -rf node_modules bower_components && npm install && bower install'
alias pp='python -mjson.tool'

source ./git-complete.bash

function java_use() {
  export JAVA_HOME=$(/usr/libexec/java_home -v $1)
  export PATH=$JAVA_HOME/bin:$PATH
  java -version
}

function tabname {
  printf "\e]1;$1\a"
}

function winname {
  printf "\e]2;$1\a"
}

function pspid() {
  ps aux | grep $1 | grep -v grep | tr -s ' ' | cut -d' ' -f2
}

function pskill() {
  pid=`pspid $1`
  sudo kill -9 $pid
}

function sp() {
  source ~/.profile
} 

if [ -f credentials ]; then
    echo "Found credential file, loading now..."
    source credentials
fi

export NVM_DIR="/Users/chrisalbert/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
