function sshd {
  shell=${2:-bash}
  docker exec -it $1 $shell
}

_sshd_complete()
{
  local cur_word
  cur_word="${COMP_WORDS[COMP_CWORD]}"

  words=$(docker ps --format "{{.Names}}")
  COMPREPLY=( $(compgen -W "$words" -- "$cur_word") )
  return 0;
}

complete -F _sshd_complete sshd
