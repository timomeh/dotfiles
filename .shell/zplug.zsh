#!/usr/bin/env zsh

export ZPLUG_HOME=/usr/local/opt/zplug
source "$ZPLUG_HOME/init.zsh"

# zsh-async
# run async jobs in zsh (useful for fast prompts)
zplug "mafredri/zsh-async"


# nigiri
# My zsh theme
zplug "~/dev/nigiri", from:local, as:theme


# alias-tips
# An oh-my-zsh plugin to help remembering those aliases you defined once
# https://github.com/djui/alias-tips
zplug "djui/alias-tips", defer:1


# enhancd
# A next-generation cd command with an interactive filter
# https://github.com/b4b4r07/enhancd
zplug "b4b4r07/enhancd", use:init.sh, defer:3


# k
# k is the new l, yo
# https://github.com/supercrabtree/k
zplug "supercrabtree/k"


# cdbk
# A ZSH plugin to allow easy named directory creation - shortcuts to any directory you want
# https://github.com/MikeDacre/cdbk
zplug "MikeDacre/cdbk"


# zsh-nvm
# Zsh plugin for installing, updating and loading nvm
# https://github.com/lukechilds/zsh-nvm
zplug "lukechilds/zsh-nvm"


# zsh-completions
# Additional completion definitions for Zsh.
# https://github.com/zsh-users/zsh-completions
zplug "zsh-users/zsh-completions"


# zsh-autosuggestions
# Fish-like autosuggestions for zsh
# https://github.com/zsh-users/zsh-autosuggestions
zplug "zsh-users/zsh-autosuggestions"


# zsh-syntax-highlighting
# Fish shell like syntax highlighting for Zsh.
# https://github.com/zsh-users/zsh-syntax-highlighting
zplug "zsh-users/zsh-syntax-highlighting", defer:3

# zsh-dirnav
# Use ctrl-left/right to navigate to parent dir or back
# https://github.com/gparker42/zsh-dirnav/
zplug "gparker42/zsh-dirnav", use:dirnav, defer:2


# Install plugins if there are plugins that have not been installed
if ! zplug check; then
	printf "Updating zsh plugins..."
    zplug install
fi


zplug load
