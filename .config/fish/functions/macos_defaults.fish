function macos_defaults
    prefs-export --output-directory ~/.config/defaults --commit
    git -C ~/.config/defaults push
end