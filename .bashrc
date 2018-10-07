export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# added by travis gem
[ -f /Users/timo/.travis/travis.sh ] && source /Users/timo/.travis/travis.sh

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

source "${HOME}/.shell/common.sh"