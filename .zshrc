# History
HISTSIZE=1000000
SAVEHIST=1000000

# Prompt for spelling correction of commands.
#setopt CORRECT
#SPROMPT='zsh: correct %F{red}%R%f to %F{green}%r%f [nyae]? '
WORDCHARS=${WORDCHARS//[\/]}

# Zim configuration

# Set a custom path for the completion dump file.
# If none is provided, the default ${ZDOTDIR:-${HOME}}/.zcompdump is used.
#zstyle ':zim:completion' dumpfile "${ZDOTDIR:-${HOME}}/.zcompdump-${ZSH_VERSION}"

# Append `../` to your input for each `.` you type after an initial `..`
#zstyle ':zim:input' double-dot-expand yes

# Set what highlighters will be used.
# See https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters.md
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)

# Customize the main highlighter styles.
# See https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters/main.md#how-to-tweak-it
#typeset -A ZSH_HIGHLIGHT_STYLES
#ZSH_HIGHLIGHT_STYLES[comment]='fg=242'

# ------------------
# Initialize modules
# ------------------

if [[ ! -e ${ZIM_HOME}/zimfw.zsh ]]; then
  # Download zimfw script if missing.
  command mkdir -p ${ZIM_HOME}
  if (( ${+commands[curl]} )); then
    command curl -fsSL -o ${ZIM_HOME}/zimfw.zsh https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh
  else
    command wget -nv -O ${ZIM_HOME}/zimfw.zsh https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh
  fi
fi
if [[ ! ${ZIM_HOME}/init.zsh -nt ${ZDOTDIR:-${HOME}}/.zimrc ]]; then
  # Install missing modules, and update ${ZIM_HOME}/init.zsh if missing or outdated.
  source ${ZIM_HOME}/zimfw.zsh init -q
fi
source ${ZIM_HOME}/init.zsh

# zsh-history-substring-search

# Bind ^[[A/^[[B manually so up/down works both before and after zle-line-init
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Bind up and down keys
zmodload -F zsh/terminfo +p:terminfo
if [[ -n ${terminfo[kcuu1]} && -n ${terminfo[kcud1]} ]]; then
  bindkey ${terminfo[kcuu1]} history-substring-search-up
  bindkey ${terminfo[kcud1]} history-substring-search-down
fi

bindkey '^P' history-substring-search-up
bindkey '^N' history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LESS="-F -g -i -M -R -S -w -X -z-4"

export THEFUCK_PRIORITY="git_hook_bypass=1100"

export PATH=$PATH:~/bin
export PATH=$PATH:~/.yarn/bin
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/platform-tools

# https://github.com/sindresorhus/guides/blob/master/how-not-to-rm-yourself.md
unsetopt rm_star_silent       # if * in rm, ask if that's correct
setopt rm_star_wait           # wait before actually doint rm some/*

bindkey -e

eval "$(starship init zsh)"
eval $(thefuck --alias)
eval "$(navi widget zsh)"
source "${HOME}/.shell/spectrum.zsh"
source "${HOME}/.shell/termsupport.zsh"
source "${HOME}/.shell/gitabbr.zsh"
source "${HOME}/.asdf/asdf.sh"
eval "$(direnv hook zsh)"

fpath=(${ASDF_DIR}/completions $fpath)
autoload -Uz compinit && compinit

alias el="exa -l"
alias et="exa --tree --ignore-glob=node_modules"
alias eg="exa -g"
alias eo="exa -1"
alias tailscale="/Applications/Tailscale.app/Contents/MacOS/Tailscale"
alias pn="pnpm"
