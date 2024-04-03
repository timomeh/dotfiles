# Prompt for spelling correction of commands.
#setopt CORRECT
#SPROMPT='zsh: correct %F{red}%R%f to %F{green}%r%f [nyae]? '
WORDCHARS=${WORDCHARS//[\/]}

# Set what highlighters will be used.
# See https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters.md
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)