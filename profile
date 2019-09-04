#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
echo "Loading profile from "$DIR
export JAVA_OPTS="-Xmx3g -XX:MaxPermSize=512m -XX:+CMSClassUnloadingEnabled"

alias d='docker'
alias g='git'
alias dc='docker-compose'
alias ls='ls -Glah'
alias chrome='open -a Google\ Chrome'
alias weather='curl http://wttr.in/'
alias nombom='npm cache clear && bower cache clean && rm -rf node_modules bower_components && npm install && bower install'
alias pp='python -mjson.tool'

source $DIR/git-complete.bash
source $DIR/sshd_complete.sh

function java_use() {
  export JAVA_HOME=$(/usr/libexec/java_home -v $1)
  export PATH=$JAVA_HOME/bin:$PATH
  java -version
}

function dockerClean() {
  docker volume rm $(docker volume ls -qf dangling=true)
  docker rmi $(docker images | grep '^<none>' | awk '{print $3}')
  docker rm $(docker ps -q -f 'status=exited')
}

function dockerWipe() {
  docker rm $(docker ps -a -q)
  docker rmi $(docker images -q)
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

if [ -f "/usr/local/opt/bash-git-prompt/share/gitprompt.sh" ]; then
    GIT_PROMPT_THEME=Default
    GIT_PROMPT_ONLY_IN_REPO=0 # Use the default prompt when not in a git repo.
    GIT_PROMPT_FETCH_REMOTE_STATUS=0 # Avoid fetching remote status
    GIT_PROMPT_SHOW_UPSTREAM=0 # Don't display upstream tracking branch
    GIT_SHOW_UNTRACKED_FILES=no # Don't count untracked files (no, normal, all)
    GIT_PROMPT_START="\[$(tput setaf 1)\]\u\[$(tput setaf 3)\]@\[$(tput setaf 4)\]\h\[$(tput setaf 5)\]:\w\[$(tput setaf 3)\] #\! \[$(tput setaf 6)\][\t]\[$(tput sgr0)\]"
    GIT_PROMPT_END="\n$ "
    source "/usr/local/opt/bash-git-prompt/share/gitprompt.sh"
fi
