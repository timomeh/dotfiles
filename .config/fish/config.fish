if status is-interactive
    # Commands to run in interactive sessions can go here
end

fish_add_path ~/.local/bin
fish_add_path /opt/homebrew/bin
fish_add_path /Applications/Sublime\ Text.app/Contents/SharedSupport/bin
fish_add_path ~/Library/pnpm

set -gx MCFLY_FUZZY 2
set -gx MCFLY_INTERFACE_VIEW TOP
set -gx VISUAL "code --wait"
set -gx THEFUCK_PRIORITY "git_hook_bypass=1100"
set -gx HOMEBREW_NO_ANALYTICS 1
set -gx HOMEBREW_BUNDLE_FILE "~/.config/brew/brewfile"

abbr -a bb brew bundle

fzf_configure_bindings --history=\e\cr

fzf --fish | source
starship init fish | source
zoxide init --cmd cd fish | source
mcfly init fish | source
mcfly-fzf init fish | source
navi widget fish | source
thefuck --alias | source