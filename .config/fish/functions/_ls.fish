# function _ls will call eza with some defaults.
# used to create an alias for ls

function _ls
  set -lx params \
    --git \
    --icons \
    --group \
    --group-directories-first \
    --time-style=long-iso \
    --color-scale=all
  
  eza $argv $params
end