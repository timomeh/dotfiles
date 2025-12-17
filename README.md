# dotfiles

Dotfiles. Mainly centered around 🐟 fish, 🐐 stow, 🍺 brew and 🧑‍🍳 mise.

## Features

- Support for different work & private profiles
- zellij
- starship prompt
- `cd` is zoxide
- `ls` is eza
- `fuck` for fuckups
- `navi` with <kbd>Ctrl-g</kbd>
- `mcfly` with <kbd>Ctrl-r</kbd>
- Search directory with <kbd>Ctrl-Alt-F</kbd>
- Search git log with <kbd>Ctrl-Alt-L</kbd>
- Search git status with <kbd>Ctrl-Alt-S</kbd>
- Search processes with <kbd>Ctrl-Alt-P</kbd>
- Search variables with <kbd>Ctrl-V</kbd>
- `g[alias]` abbreviates to `git [alias]`
- macos config backups

## Workflows

### Getting started

Hey future me! For a complete fresh setup:

1. Run `xcode-select --install` to install whatever macOS needs
2. Install homebrew
3. Clone this repo into your home directory (~/dotfiles)
4. `dot pull`
5. `brew bundle`
6. Go to https://github.com/timomeh/macos-defaults to restore macOS settings

### Usage

```
dot sync
dot adopt
dot pull
```

#### Add a new file

Create the file in the `~/dotfiles` directory, as if it were the home directory. Then run:

```console
dot sync

# This will run: stow --no-folding .
```

This will create a symlink into the home directory.

#### Add an existing non-tracked file

To track an existing file in the home directory, create an empty file in this project as if the project root were the home directory. Then run:

```console
dot adopt

# This will run: stow --adopt .
```

This will copy the file contents into the dotfile directory and turn it into a link.

#### Pull changes

```console
dot pull
```

This will do a git pull of the dotfiles repo and then run a sync.

### Brew Bundle

Use `brew bundle [add|remove|cleanup|install]` to manage installations via brew, so the brewfile is automatically updates. [Read more](https://docs.brew.sh/Manpage#bundle-subcommand)

### macOS Settings

To backup the current macos settings, run:

```console
macos_defaults
```

It automatically commits and pushs into https://github.com/timomeh/macos-defaults 🔒

## Background

- I can run those dotfiles on different machines with different configurations based on the `FISH_PROFILE_NAME` environment variable.
- I use Homebrew (via brew bundle) for everything where I just want the latest version.
- I use mise for stuff where I'm interested in a specific version, or for global npm packages.