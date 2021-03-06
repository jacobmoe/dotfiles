# -*- mode: sh -*-

# ---- colors ---------------------------------------------------------------

export CLICOLOR=1

# Set colors to match iTerm2 Terminal Colors
export TERM=xterm-256color

# ---- GIT ------------------------------------------------------------------

# git tab-completion: https://git-scm.com/book/en/v2/Appendix-A%3A-Git-in-Other-Environments-Git-in-Zsh
# fix insecure directory warning: https://stackoverflow.com/questions/13762280/zsh-compinit-insecure-directories
autoload -Uz compinit && compinit
autoload -Uz vcs_info

function git_current_branch_name {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo "("${ref#refs/heads/}")"
}

export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWUNTRACKEDFILES=true

# ---- prompt --------------------------------------------------------------

# https://medium.com/dev-genius/customize-the-macos-terminal-zsh-4cb387e4f447

setopt PROMPT_SUBST
PS1='%n %~ %F{yellow}$(git_current_branch_name)%f %% '

# ---- general --------------------------------------------------------------

alias ll="ls -lahG"
