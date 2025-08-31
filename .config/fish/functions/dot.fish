function dot
  switch $argv[1]
    case sync
      stow --no-folding . -d ~/dotfiles
    case adopt
      stow --adopt . -d ~/dotfiles
    case pull
      command git -C ~/dotfiles pull
      stow --no-folding . -d ~/dotfiles
    case '*'
      echo "Usage: dot {sync|adopt|pull}"
  end
end