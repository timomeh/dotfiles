for alias in (git wat | string match -r '^[^=]+' | string trim)
    alias "g$alias" "git $alias"
end
