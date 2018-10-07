#!/usr/bin/env bash

eval "$(rbenv init -)"
eval $(thefuck --alias)


# ---------------------------------------------------------
# Exports
# ---------------------------------------------------------

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export NVM_AUTO_USE=false
export NVM_LAZY_LOAD=true
export ENHANCD_DOT_ARG=.
export ENHANCD_HYPHEN_ARG=--
export ANDROID_HOME=~/Library/Android/sdk
export ANDROID_SDK=~/Library/Android/sdk
export ANDROID_NDK=~/Library/Android/ndk
export DOKKU_HOST=apps.railslabs.com


# ---------------------------------------------------------
# PATH
# ---------------------------------------------------------

export PATH=$PATH:~/bin # Misc bins
export PATH=$PATH:~/.yarn/bin # Yarn
export PATH=$PATH:~/.rbenv/bin # rbenv
export PATH=$PATH:$ANDROID_HOME/tools # Android Tools
export PATH=$PATH:$ANDROID_HOME/platform-tools # Android Platform Tools
export PATH=$PATH:/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin # vs code


# ---------------------------------------------------------
# Aliases
# ---------------------------------------------------------

alias flushdns="sudo dscacheutil -flushcache && sudo killall -HUP mDNSResponder"
alias dokku="bash $HOME/.dokku/contrib/dokku_client.sh"
alias dotfiles="git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
alias d="docker"
alias pping='prettyping --nolegend'


# ---------------------------------------------------------
# Git Aliases – read from `git wat`
# ---------------------------------------------------------

OLD_IFS=$IFS; IFS=$'\n'
for al in `git wat`; do
  alias g${al%=*}="git ${al%=*}"
done; IFS=$OLD_IFS
