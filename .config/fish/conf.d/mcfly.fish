set -gx MCFLY_FUZZY 2
set -gx MCFLY_INTERFACE_VIEW TOP
set -gx FZF_CTRL_R_OPTS "--reverse"

mcfly init fish | source
mcfly-fzf init fish | source