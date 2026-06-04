fzf_configure_bindings --history=\e\cr

# init a bunch of misc stuff
fzf --fish | source
thefuck --alias | source
navi widget fish | source
zoxide init --cmd cd fish | source
starship init fish | source

# init mcfly
set -x MCFLY_FUZZY 2
set -x MCFLY_INTERFACE_VIEW TOP
set -x FZF_CTRL_R_OPTS "--reverse"
mcfly init fish | source
mcfly-fzf init fish | source

# abbreviations
abbr -a bb brew bundle
abbr -a pn pnpm
abbr -a lg lazygit
abbr -a z zed
abbr -a oc opencode

# generate abbreviations for all git aliases: g[alias] -> git [alias]
for alias in (git wat | string match -r '^[^=]+' | string trim)
  abbr -a "g$alias" "git $alias"
end

# aliases
alias ls="_ls"
alias ll="_ls --header --long"
alias la="_ls --header --long --all --all"
alias tailscale="/Applications/Tailscale.app/Contents/MacOS/Tailscale"
alias zj="zellij"
alias code="zed"

# path
fish_add_path ~/.local/bin
fish_add_path /opt/homebrew/bin
fish_add_path /opt/homebrew/sbin
fish_add_path /Applications/Sublime\ Text.app/Contents/SharedSupport/bin
fish_add_path ~/Library/pnpm

# env vars
set -x VISUAL "zed --wait"
set -x EDITOR "zed --wait"
set -x HOMEBREW_NO_ANALYTICS 1
set -x HOMEBREW_BUNDLE_DUMP_NO_VSCODE 1
set -x HOMEBREW_BUNDLE_FILE ~/.config/homebrew/Brewfile

if not set -q XDG_CONFIG_HOME
  set -x XDG_CONFIG_HOME ~/.config
end

# local profile, not tracked in git
set -l local_profile_path ~/.config/fish/config_local.fish
if test -f $local_profile_path
  source $local_profile_path
end
