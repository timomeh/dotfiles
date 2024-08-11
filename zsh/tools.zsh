# Config for tools

export LESS="-F -g -i -M -R -S -w -X -z-4"
export THEFUCK_PRIORITY="git_hook_bypass=1100"
export HOMEBREW_NO_ANALYTICS=1
export EDITOR="code --wait"

# Change directories in LS to underlined light purple
export LS_COLORS=$LS_COLORS:'di=4;95:'

eval "$(thefuck --alias)"
