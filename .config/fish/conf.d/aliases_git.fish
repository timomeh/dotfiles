# create shell aliases for git aliases:
# g[alias] -> git [alias]
#
# The git aliases are read with a git alias called `git wat`,
# which returns all aliases.

for alias in (git wat | string match -r '^[^=]+' | string trim)
  alias "g$alias" "git $alias"
end
