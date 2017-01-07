# -*- mode: sh -*-

homebrew=/usr/local/bin:/usr/local/sbin
PATH=$homebrew:$PATH
PATH="/Applications/Postgres.app/Contents/MacOS/bin:$PATH"
PATH="$PATH:/usr/local/mysql/bin"
# export DYLD_LIBRARY_PATH=/usr/local/mysql/lib:$DYLD_LIBRARY_PATH

# Default editor
# export EDITOR='subl -w'
export BUNDLER_EDITOR='emacs'

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

# Make the GITs nice
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
# enbable auto-switching:
source /usr/local/opt/chruby/share/chruby/auto.sh

chruby ruby-2.3.1 # set default ruby

# ---- golang ---------------------------------------------------------------

# export GOROOT="/usr/local/Cellar/go/1.4.2"
export GOPATH="$HOME/code/go"
PATH="$PATH:$GOROOT/bin:$GOPATH/bin"

# [[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"

# ---- lisp -----------------------------------------------------------------

# for roswell
export QUICKLISP_HOME="$HOME/quicklisp/"

# ---- python ---------------------------------------------------------------

# pip should only run if there is a virtualenv currently activated
# export PIP_REQUIRE_VIRTUALENV=true

# export WORKON_HOME="$HOME/.virtualenvs"
# export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3
# source /usr/local/bin/virtualenvwrapper.sh

# ---- aliases --------------------------------------------------------------

alias ll="ls -lahG"
alias em='open -a /Applications/Emacs.app "$@"'

# ---- functions ------------------------------------------------------------

# open man page in sublime
function sman() {
  man "${1}" | col -b | subl
}

# run sql on a mysql or postgres db without entering the mysql/psql console
# usage:  db "select * from my_table"
function db() {
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

# ---- TEMP ----------------------------------------------------------------
# for algorithms class library
export CLASSPATH=$HOME/algs4/stdlib.jar:$HOME/algs4/slgs4.jar:$CLASSPATH

# ---- path ----------------------------------------------------------------
PATH="$HOME/bin:$PATH"
export PATH
