# dotfiles

Dotfiles. fish & stow.

## Workflows

To add a new dotfile:

```console
stow .
```

To track an existing file as a dotfile, create the empty file in the dotfiles directory, then run:

```console
stow --adopt .
```