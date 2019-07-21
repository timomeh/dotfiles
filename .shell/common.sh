#!/usr/bin/env bash

# rbenv() {
#   eval "$(command rbenv init -)"
#   rbenv "$@"
# }

fuck() {
  eval $(command thefuck --alias)
  fuck "$@"
}

eval "$(command rbenv init -)"


# ---------------------------------------------------------
# Exports
# ---------------------------------------------------------

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export NVM_AUTO_USE=false
export NVM_LAZY_LOAD=false
export ENHANCD_DOT_ARG=.
export ENHANCD_HYPHEN_ARG=--
export ANDROID_HOME=~/Library/Android/sdk
export ANDROID_SDK=~/Library/Android/sdk
export ANDROID_NDK=~/Library/Android/ndk
export DOKKU_HOST=apps.railslabs.com

if [ "$TERM_PROGRAM" = "Hyper" ]; then
  export NVM_LAZY_LOAD=true
fi


# ---------------------------------------------------------
# PATH
# ---------------------------------------------------------

export PATH=$PATH:~/bin # Misc bins
export PATH=$PATH:~/.yarn/bin # Yarn
export PATH=$PATH:~/.rbenv/bin # rbenv
export PATH=$PATH:$ANDROID_HOME/tools # Android Tools
export PATH=$PATH:$ANDROID_HOME/platform-tools # Android Platform Tools
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/11/bin/ # Postgres bins

# ---------------------------------------------------------
# nigiri prompt
# ---------------------------------------------------------

NIGIRI_PROMPT_MODULES=(
  newline
  cwd
  git
  wild_nigiri
  newline
  exit_status
)

export NMOD_CWD_FORMAT="%B%{$FG[255]%}CWD %f%b"
export NMOD_EXIT_STATUS_GOOD="▲ "
export NMOD_EXIT_STATUS_BAD="%F{red}▲ %f"
export NMOD_GIT_FORMAT="%{$FG[250]%}on%f GIT"
export NMOD_GIT_BRANCH_FORMAT="%B%F{white}BRANCH%f%b"
export NMOD_GIT_UNTRACKED="%B%F{red}▰%f%b"
export NMOD_GIT_CHANGED="%B%F{yellow}▰%f%b"
export NMOD_GIT_STAGED="%B%F{blue}▰%f%b"
export NMOD_GIT_DETACHED="%B%F{blue}▰%f%b"
export NMOD_GIT_CLEAN="%B%F{green}▰%f%b"

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
