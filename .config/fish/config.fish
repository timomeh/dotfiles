fzf_configure_bindings --history=\e\cr

if not set -q FISH_PROFILE_NAME
  echo ""
  echo "🎏 FISH_PROFILE_NAME is not set."
  echo "   You can set it like this:"
  echo "     set -Ux FISH_PROFILE_NAME timo"
  echo ""
end

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

# path
fish_add_path ~/.local/bin
fish_add_path /opt/homebrew/bin
fish_add_path /opt/homebrew/sbin
fish_add_path /Applications/Sublime\ Text.app/Contents/SharedSupport/bin
fish_add_path ~/Library/pnpm

# env vars
set -x VISUAL "code --wait"
set -x HOMEBREW_NO_ANALYTICS 1
set -x HOMEBREW_BUNDLE_DUMP_NO_VSCODE 1

if not set -q XDG_CONFIG_HOME
  set -x XDG_CONFIG_HOME ~/.config
end

# different profiles
if set -q FISH_PROFILE_NAME
  set -l profile_path ~/.config/fish/config_$FISH_PROFILE_NAME.fish
  if test -f $profile_path
    source $profile_path
  end
end

# local profile, not tracked in git
set -l local_profile_path ~/.config/fish/config_local.fish
if test -f $local_profile_path
  source $local_profile_path
end

if status is-interactive
  export ZELLIJ_CONFIG_DIR=$HOME/.config/zellij
  if [ "$TERM" = "xterm-ghostty" ]
    eval (zellij setup --generate-auto-start fish | string collect)
  end
end