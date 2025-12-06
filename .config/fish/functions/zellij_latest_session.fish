function zellij_latest_session
    set -l cache_file ~/.cache/zellij-last-session

    if test -f $cache_file
        cat $cache_file 2>/dev/null | string trim
        return 0
    end

    return 1
end