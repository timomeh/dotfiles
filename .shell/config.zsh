#!/usr/bin/env zsh


# =========================================================
# Configurations for zsh
# =========================================================


# ---------------------------------------------------------
# Completion
# ---------------------------------------------------------

zstyle ':completion:*' list-colors "${(@s.:.)LS_COLORS}"
zstyle ':completion:*' menu select
zstyle ':completion:*' completer _complete _ignored
zstyle :compinstall filename "$HOME/.zshrc"

autoload -Uz compinit && compinit
autoload -Uz colors && colors

fpath=(/usr/local/share/zsh-completions $fpath)


# ---------------------------------------------------------
# Options
# ---------------------------------------------------------

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

# https://github.com/sindresorhus/guides/blob/master/how-not-to-rm-yourself.md
unsetopt RM_STAR_SILENT
setopt RM_STAR_WAIT

setopt appendhistory autocd beep
unsetopt extendedglob notify
bindkey -e

setopt prompt_subst
