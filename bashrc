# -*- mode: sh -*-

homebrew=/usr/local/bin:/usr/local/sbin
PATH=$homebrew:$PATH

# ---- colors ---------------------------------------------------------------

RED="\[\033[0;31m\]"
YELLOW="\[\033[0;33m\]"
GREEN="\[\033[0;32m\]"
BLUE="\[\033[0;34m\]"

export CLICOLOR=1

# Set colors to match iTerm2 Terminal Colors
export TERM=xterm-256color

# ---- screen ---------------------------------------------------------------

screen_for_prompt() {
  if [ -n "$STY" ]; then
    echo "[$STY] "
  fi
}

# ---- GIT ------------------------------------------------------------------

function parse_git_branch {
 ref=$(git symbolic-ref HEAD 2> /dev/null) || return
 echo "("${ref#refs/heads/}")"
}

source /usr/local/etc/bash_completion.d/git-completion.bash
export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWUNTRACKEDFILES=true

# ---- prompt --------------------------------------------------------------

PS1="$BLUE\$(screen_for_prompt)$RED\$(date +%H:%M) \w$YELLOW \$(parse_git_branch)$GREEN\$ "

# ---- ruby ----------------------------------------------------------------

# rbenv

# eval "$(rbenv init -)"
# PATH="$HOME/.rbenv/bin:$PATH"

# chruby

source /usr/local/opt/chruby/share/chruby/chruby.sh
# enable auto-switching:
source /usr/local/opt/chruby/share/chruby/auto.sh

chruby ruby-2.4.6 # set default ruby

export BUNDLER_EDITOR='emacs'

# run sql on a mysql or postgres db without entering the mysql/psql console
# usage:  db "select * from my_table"
db() {
  if [ ! -f ./config/database.yml ]; then
    echo "only works from a rails project's root"
    return
  fi

  read -a db_info <<< $(ruby -e '
    require "yaml"
    dev = YAML.load_file("config/database.yml")["development"]
    puts [dev["adapter"], dev["database"], dev["username"]].join(" ")
  ')

  case ${db_info[0]} in
    mysql2    ) mysql --database=${db_info[1]} --user=${db_info[2]} -e "$1";;
    postgresql) psql ${db_info[1]} -c "$1";;
    *         ) echo "only mysql2 and postgresql adapters are supported";;
  esac
}

# ---- golang ---------------------------------------------------------------

export GOPATH="$HOME/code/go"
PATH="$PATH:$GOPATH/bin"

# ---- lisp -----------------------------------------------------------------

export LISP_APP_ENV=development

# for roswell
export QUICKLISP_HOME="$HOME/quicklisp/"

# ---- python ---------------------------------------------------------------

# pip should only run if there is a virtualenv currently activated
# export PIP_REQUIRE_VIRTUALENV=true

# export WORKON_HOME="$HOME/.virtualenvs"
# export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3
# source /usr/local/bin/virtualenvwrapper.sh

export PATH="$HOME/miniconda3/bin:$PATH"

# ---- rust -----------------------------------------------------------------

export PATH="$HOME/.cargo/bin:$PATH"

# ---- docker ---------------------------------------------------------------

set_docker_machine_from_file() {
  if [ -e ".docker-machine" ]; then
    machine_name=$(< .docker-machine)

    if [ "$(docker-machine status $machine_name)" = "Running" ]; then
      eval $(docker-machine env $machine_name)
      echo "current docker-machine is $machine_name"
    else
      echo -e "docker-machine $machine_name is stopped"
    fi
  fi
}

docker-compose() {
  if [ -e ".docker-machine" ]; then
    name=$(< .docker-machine)
    indicator="$(docker-machine ls --filter name="^$name$" --format "{{.Active}}")"

    if [ "$indicator" == "*" ]; then
      command docker-compose "$@"
    else
      echo -e "current machine is $machine_name but it's not active."
    fi
  else
    command docker-compose "$@"
  fi
}

# cd() {
#   if [ $# -eq 0 ]; then
#     builtin cd
#   else
#     builtin cd "$1"
#     set_docker_machine_from_file
#   fi
# }

# ---- kubernetes -----------------------------------------------------------

# ---- postgres -------------------------------------------------------------

# ---- general --------------------------------------------------------------

alias ll="ls -lahG"

# ---- scripts ----------------------------------------------------------------

PATH="$HOME/bin:$PATH"

export PATH

# set_docker_machine_from_file
