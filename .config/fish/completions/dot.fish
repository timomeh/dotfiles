# Offer subcommands
complete -c dot -f -n '__fish_use_subcommand' -a 'sync'  -d 'stow --no-folding .'
complete -c dot -f -n '__fish_use_subcommand' -a 'adopt' -d 'stow --adopt .'
complete -c dot -f -n '__fish_use_subcommand' -a 'pull'  -d 'git pull, then sync'

# After choosing a subcommand, don’t complete files
complete -c dot -f -n '__fish_seen_subcommand_from sync adopt pull'