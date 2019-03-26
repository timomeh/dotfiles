#!/usr/bin/env zsh


# =========================================================
# Configurations for zsh
# =========================================================


# ---------------------------------------------------------
# Completion
# ---------------------------------------------------------

fpath=(/usr/local/share/zsh-completions $fpath)
fpath=(~/.zsh/completion $fpath)

# do compinit only once a day
autoload -Uz compinit
if [ $(date +'%j') != $(stat -f '%Sm' -t '%j' ~/.zcompdump) ]; then
  compinit
else
  compinit -C
fi

zmodload -i zsh/complist

setopt always_to_end      # jump to end when completing
setopt complete_in_word   # completion when inside of word
setopt correct            # correct completion

# Completion Cache
zstyle ':completion::complete:*' use-cache 1
zstyle ':completion:*' cache-path ~/.zsh/cache

# Complete lowercase also to uppercase
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# Use select menu for autocomplete options
zstyle ':completion:*:*:*:*:*' menu select


# Colors in completion
zstyle ':completion:*' list-colors ''
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'

# Completers
zstyle ':completion:*::::' completer _expand _complete _ignored _approximate

# Sections in completion
zstyle ':completion:*' verbose yes
zstyle ':completion:*:messages' format $'\e[00;31m%d\e[0m'
zstyle ':completion:*:manuals' separate-sections true

zstyle :compinstall filename "$HOME/.zshrc"

# ---------------------------------------------------------
# Options
# ---------------------------------------------------------

autoload -U colors
colors

HISTFILE=~/.histfile
HISTSIZE=1000000
SAVEHIST=1000000

setopt append_history         # append history
setopt inc_append_history     # append history directly after typed, not just
                              #   until exit
setopt share_history          # share history between sessions

setopt auto_cd                # cd automatically, if command is directory
setopt beep                   # beep bop on error
setopt prompt_subst           # allow fancy prompts

unsetopt extended_glob        # don't use extended globs
unsetopt notify               # don't notify background jobs

# https://github.com/sindresorhus/guides/blob/master/how-not-to-rm-yourself.md
unsetopt rm_star_silent       # if * in rm, ask if that's correct
setopt rm_star_wait           # wait before actually doint rm some/*

bindkey -e
