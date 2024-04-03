# Automatic git alias creation.
# Adds aliases for all git aliases, prefixed with g.
# Uses the `git wat` alias to loop over all aliases.
for al in `git wat`; do
  alias g${al%%=*}="git ${al%%=*}"
done; IFS=$OLD_IFS

alias tailscale="/Applications/Tailscale.app/Contents/MacOS/Tailscale"
alias pn="pnpm"
