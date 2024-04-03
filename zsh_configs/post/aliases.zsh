# Git Aliases – read from `git wat` and abbrev them `g`

OLD_IFS=$IFS; IFS=$'\n'
for al in `git wat`; do
  alias g${al%%=*}="git ${al%%=*}"
done; IFS=$OLD_IFS

alias el="exa -l"
alias et="exa --tree --ignore-glob=node_modules"
alias eg="exa -g"
alias eo="exa -1"
alias tailscale="/Applications/Tailscale.app/Contents/MacOS/Tailscale"
alias pn="pnpm"
