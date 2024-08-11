# dotfiles

Dotfiles

- managed with [stow](https://www.gnu.org/software/stow/)
- inspired by a video from [Dreams of Autonomy](https://www.youtube.com/watch?v=y6XCebnB9gs)
- using [zinit](https://github.com/zdharma-continuum/zinit) to load zsh config and plugins

## Workflows

### Add a new file to dotfiles

Add the file into `/dotfiles`. The file structure inside the dotfiles directory needs to be the same as if it were in the home directory. Then run:

```console
stow .
```

It will symlink the new file.

### Track an existing file in dotfiles

Create an empty file which you want to track in the `/dotfiles` directory. The file structure inside the dotfiles directory needs to be the same as if it were in the home directory. The run:

```console
stow --adopt .
```

It will copy the file contents of the existing "old" dotfile into the "new" dotfile, and symlink the file.
