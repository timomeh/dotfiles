p_bold=$'%{\e[1m%}'
p_black=$'%{\e[30m%}'
p_red=$'%{\e[31m%}'
p_green=$'%{\e[32m%}'
p_yellow=$'%{\e[33m%}'
p_blue=$'%{\e[34m%}'
p_magenta=$'%{\e[35m%}'
p_cyan=$'%{\e[36m%}'
p_light_gray=$'%{\e[37m%}'
p_dark_gray=$'%{\e[90m%}'
p_light_red=$'%{\e[91m%}'
p_light_green=$'%{\e[92m%}'
p_light_yellow=$'%{\e[93m%}'
p_light_blue=$'%{\e[94m%}'
p_light_magenta=$'%{\e[95m%}'
p_light_cyan=$'%{\e[96m%}'
p_dim=$'%{\e[2m%}'
p_reset=$'%{\e[0m%}'

# Show Git branch/tag, or name-rev if on detached head
parse_git_branch() {
  (git symbolic-ref -q HEAD || git name-rev --name-only --no-undefined --always HEAD) 2> /dev/null
}

# Show different symbols as appropriate for various Git repository states
__prompt_git_status() {
  local git_where="$(parse_git_branch)"
  [ ! -n "$git_where" ] && return 0

  local GIT_PROMPT_MERGING="😨 "
  local GIT_PROMPT_REBASE="😰 "
  local GIT_PROMPT_DETACHED="🔥 "
  local GIT_PROMPT_UNTRACKED="%{$p_red%}●%{$p_reset%}"
  local GIT_PROMPT_MODIFIED="%{$p_p_yellow%}●%{$p_reset%}"
  local GIT_PROMPT_STAGED="%{$p_cyan%}●%{$p_reset%}"
  local GIT_PROMPT_GOOD="%{$p_green%}●%{$p_reset%}"

  # Compose this value via multiple conditional appends.
  local GIT_STATE=""

  local GIT_DIR="$(git rev-parse --git-dir 2> /dev/null)"
  if [ -n $GIT_DIR ] && test -r $GIT_DIR/MERGE_HEAD; then
    GIT_STATE=$GIT_STATE$GIT_PROMPT_MERGING
  fi

  if [ -n $GIT_DIR ] && test -d $GIT_DIR/rebase-merge -o -d $GIT_DIR/rebase-apply; then
    GIT_STATE=$GIT_STATE$GIT_PROMPT_REBASE
  fi

  if [[ -n $(git ls-files --other --exclude-standard 2> /dev/null) ]]; then
    GIT_STATE=$GIT_STATE$GIT_PROMPT_UNTRACKED
  fi

  if [[ -n $(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/' | grep detached) ]]; then
    GIT_STATE=$GIT_STATE$GIT_PROMPT_DETACHED
  fi

  if ! git diff --quiet 2> /dev/null; then
    GIT_STATE=$GIT_STATE$GIT_PROMPT_MODIFIED
  fi

  if ! git diff --cached --quiet 2> /dev/null; then
    GIT_STATE=$GIT_STATE$GIT_PROMPT_STAGED
  fi

  if [[ -n $GIT_STATE ]]; then
    PS1+=" $GIT_STATE${p_reset}"
  else
    PS1+=" $GIT_PROMPT_GOOD${p_reset}"
  fi
}

__prompt_git_up_down() {
  local git_where="$(parse_git_branch)"
  [ ! -n "$git_where" ] && return 0

  local AMOUNT_ON_UPSTREAM=$(git rev-list --left-right --boundary @{u}... 2> /dev/null | grep -o '<' | wc -l)
  local AMOUNT_ON_MACHINE=$(git rev-list --left-right --boundary @{u}... 2> /dev/null | grep -o '>' | wc -l)

  if [[ "$AMOUNT_ON_UPSTREAM" -gt 0 ]]; then
    PS1+=" $p_bold$p_light_red${AMOUNT_ON_UPSTREAM//[[:blank:]]/}⇣$p_reset"
  fi
  if [[ "$AMOUNT_ON_MACHINE" -gt 0 ]]; then
    PS1+=" $p_bold$p_yellow${AMOUNT_ON_MACHINE//[[:blank:]]/}⇡$p_reset"
  fi
}

# If inside a Git repository, print its branch and state
__prompt_git_on() {
  local git_where="$(parse_git_branch)"
  [ ! -n "$git_where" ] && return 0

  PS1+="${p_bold}${p_dim}${p_light_gray} on ${git_where#(refs/heads/|tags/)}${p_reset}"
}

__prompt_last_status() {
  PS1+="%(?.${p_yellow}▲.${p_red}▲)${p_reset}"
}

__prompt_dir() {
  PS1+="${p_bold}${p_dark_gray}%~${p_reset}"
}

__prompt_spaces() {
  local spacewidth
  local zero='%([BSUbfksu]|([FK]|){*})'
  local pslength=${#${(S%%)PS1//$~zero/}}
  ((spacewidth = ${COLUMNS} - ${pslength} - 10))
  local spacing=""
  for i in {1..$spacewidth}; do
    spacing="${spacing} "
  done
  PS1+=$spacing
}

__prompt_date() {
  PS1+=" ${p_dark_gray}[%D{%T}]${p_reset}"
}

__prompt_newline() {
  PS1+="
"
}

__print_prompt() {
  PS1=""
  __prompt_newline
  __prompt_dir
  __prompt_git_on
  __prompt_git_status
  __prompt_git_up_down
  __prompt_spaces
  __prompt_date
  __prompt_newline
  __prompt_last_status
  PS1+=" "
}

__print_bash_prompt() {
  export PS1="\u:\W > \[$(tput sgr0)\]"
}

[ ${ZSH_VERSION} ] && precmd() { __print_prompt; }
[ ${BASH_VERSION} ] && PROMPT_COMMAND=__print_bash_prompt
