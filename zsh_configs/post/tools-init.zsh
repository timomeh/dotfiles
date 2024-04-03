export LESS="-F -g -i -M -R -S -w -X -z-4"
export THEFUCK_PRIORITY="git_hook_bypass=1100"

eval "$(starship init zsh)"
eval "$(thefuck --alias)"
eval "$(navi widget zsh)"
eval "$(direnv hook zsh)"