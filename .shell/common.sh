#!/usr/bin/env bash


source "$HOME/.shell/prompt.sh"


# ---------------------------------------------------------
# PATH
# ---------------------------------------------------------

export PATH=${PATH}:~/bin
export PATH=${PATH}:~/.yarn/bin


# ---------------------------------------------------------
# Other Exports
# ---------------------------------------------------------

export NVM_AUTO_USE=true
export NVM_LAZY_LOAD=true


# ---------------------------------------------------------
# Aliases
# ---------------------------------------------------------

alias flushdns="sudo dscacheutil -flushcache && sudo killall -HUP mDNSResponder"
alias dokku="bash $HOME/.dokku/contrib/dokku_client.sh"
alias dotfiles="git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
alias d="docker"


# ---------------------------------------------------------
# Git Aliases – read from `git wat`
# ---------------------------------------------------------

OLD_IFS=$IFS; IFS=$'\n'
for al in `git wat`; do
  alias g${al%=*}="git ${al%=*}"
done; IFS=$OLD_IFS
