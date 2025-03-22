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