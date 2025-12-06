# Update the cache file with current session
function __zellij_update_cache
    if set -q ZELLIJ_SESSION_NAME
        mkdir -p ~/.cache
        echo $ZELLIJ_SESSION_NAME > ~/.cache/zellij-last-session
    end
end

function __zellij_track_session_on_prompt --on-event fish_prompt
    __zellij_update_cache
end

function __zellij_track_session_on_cancel --on-event fish_cancel
    __zellij_update_cache
end

function __zellij_track_session_on_exit --on-event fish_exit
    __zellij_update_cache
end
