local bold=$'\e[1m'
local black=$'\e[30m'
local red=$'\e[31m'
local green=$'\e[32m'
local yellow=$'\e[33m'
local blue=$'\e[34m'
local magenta=$'\e[35m'
local cyan=$'\e[36m'
local light_gray=$'\e[37m'
local dark_gray=$'\e[90m'
local light_red=$'\e[91m'
local light_green=$'\e[92m'
local light_yellow=$'\e[93m'
local light_blue=$'\e[94m'
local light_magenta=$'\e[95m'
local light_cyan=$'\e[96m'
local dim=$'\e[2m'
local reset=$'\e[0m'

# Modify the colors and symbols in these variables as desired.
GIT_PROMPT_MERGING="😨 "
GIT_PROMPT_REBASE="😰 "
GIT_PROMPT_DETACHED="🔥 "
GIT_PROMPT_UNTRACKED="%{$red%}●%{$reset%}"
GIT_PROMPT_MODIFIED="%{$yellow%}●%{$reset%}"
GIT_PROMPT_STAGED="%{$cyan%}●%{$reset%}"
GIT_PROMPT_GOOD="%{$green%}●%{$reset%}"

# Show Git branch/tag, or name-rev if on detached head
parse_git_branch() {
  (git symbolic-ref -q HEAD || git name-rev --name-only --no-undefined --always HEAD) 2> /dev/null
}

# Show different symbols as appropriate for various Git repository states
parse_git_state() {

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
    echo " $GIT_STATE"
  else
    echo " $GIT_PROMPT_GOOD"
  fi

}

git_up_down() {
  local AMOUNT_ON_UPSTREAM=$(git rev-list --left-right --boundary @{u}... 2> /dev/null | grep -o '<' | wc -l)
  local AMOUNT_ON_MACHINE=$(git rev-list --left-right --boundary @{u}... 2> /dev/null | grep -o '>' | wc -l)
  local AMOUNT_STRING=""

  if [[ "$AMOUNT_ON_UPSTREAM" -gt 0 ]]; then
    AMOUNT_STRING="$AMOUNT_STRING$bold$dark_gray${AMOUNT_ON_UPSTREAM//[[:blank:]]/}⇣$reset"
  fi
  if [[ "$AMOUNT_ON_MACHINE" -gt 0 ]]; then
    AMOUNT_STRING="$AMOUNT_STRING $bold$dark_gray${AMOUNT_ON_MACHINE//[[:blank:]]/}⇡$reset"
  fi

  echo " $AMOUNT_STRING"

}

# If inside a Git repository, print its branch and state
git_on_string() {
  local git_where="$(parse_git_branch)"
  [ -n "$git_where" ] && echo " on ${git_where#(refs/heads/|tags/)}"
}

git_status_indicator() {
  local git_where="$(parse_git_branch)"
  [ -n "$git_where" ] && echo "$(parse_git_state)$reset"
}


local current_dir='%~'
local status_indicator="%(?.%(!.$red▼.$cyan▲).$red▼)$reset"
local git_info='$(git_on_string)'
local git_status='$(git_status_indicator)'
local git_count='$(git_up_down)'


PROMPT="
${bold}${dark_gray}${current_dir}${reset}\
${bold}${dim}${light_gray}${git_info}${reset}\
${git_status}${git_count}
${status_indicator} "
