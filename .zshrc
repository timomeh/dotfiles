# Load bash ~/.profile inside zsh
# http://superuser.com/questions/187639/zsh-not-hitting-profile/187673#187673
if [ -f "${HOME}/.profile" ]; then
	emulate sh -c "source ${HOME}/.profile"
fi

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"


source "${HOME}/.shell/common.sh"
source "${HOME}/.shell/zplug.zsh"
source "${HOME}/.shell/config.zsh"

# travis gem
(test -e "${HOME}/.travis/travis.zsh" && source /Users/timo/.travis/travis.sh) || true
