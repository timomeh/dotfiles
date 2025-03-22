# dotfiles

Dotfiles. Mainly centered around stow, fish, brew and mise.

- [**stow**](https://www.gnu.org/software/stow/) manages symlinks to sync and backup dotfiles.
- [**fish**](https://fishshell.com/) is a fast and easy to configure shell with many batteries included, so it doesn't need crazy setups like zsh does.
- [**brew**](https://brew.sh/) installs tools that I may use globally and/or when I don't care about the versions and just want the latest.
- [**mise**](https://mise.jdx.dev/) also installs tools but I use it for stuff that is specific to a project (like different runtime versions), and I want to automatically switch it depending on the current working directory.

## Workflows

### Tracking dotfiles

To link a new dotfile, create it inside this project as if the project root were the home directory. Then run:

```console
stow .
```

To track an existing file in the home directory, create an empty file in this project as if the project root were the home directory. Then run:

```console
stow --adopt .
```

It will copy the contents and link it.

### Brew

Use `brew bundle [add|remove|cleanup|install]` to manage installations via brew. [Read more][brew]

[brew]: https://docs.brew.sh/Manpage#bundle-subcommand