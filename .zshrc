# Load bash ~/.profile inside zsh
# http://superuser.com/questions/187639/zsh-not-hitting-profile/187673#187673
if [ -f "$HOME/.profile" ]; then
	emulate sh -c "source $HOME/.profile"
fi


source "$HOME/.shell/common.sh"
source "$HOME/.shell/zplug.zsh"
source "$HOME/.shell/config.zsh"
