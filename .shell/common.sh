#!/usr/bin/env bash


source "$HOME/.shell/prompt.sh"

eval "$(rbenv init -)"
eval $(thefuck --alias)


# ---------------------------------------------------------
# PATH
# ---------------------------------------------------------

export PATH=${PATH}:~/bin
export PATH=${PATH}:~/.yarn/bin
export PATH="$HOME/.rbenv/bin:$PATH"


# ---------------------------------------------------------
# Other Exports
# ---------------------------------------------------------

export NVM_AUTO_USE=true
export NVM_LAZY_LOAD=true
export ENHANCD_DOT_ARG=.
export ENHANCD_HYPHEN_ARG=--
export ANDROID_HOME=~/Library/Android/sdk
export ANDROID_SDK=~/Library/Android/sdk
export ANDROID_NDK=~/Library/Android/ndk


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
