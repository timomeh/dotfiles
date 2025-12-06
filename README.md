# dotfiles

Dotfiles. Mainly centered around 🐟 fish, 🐐 stow, 🍺 brew and 🧑‍🍳 mise.

## Features

- Different profiles
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

## Workflows

### Getting started

Hey future me! For a complete fresh setup:

1. Run `xcode-select --install` to install git
2. Install homebrew
3. Clone this repo into your home directory (~/dotfiles)
4. `cd ~/dotfiles && stow --no-folding .`
5. `~/dotfiles/macos.sh`
6. `brew bundle`

### Usage

#### Add a new file

Create the file in the `~/dotfiles` directory, as if it were the home directory. Then run:

```console
dot sync

# This will run: stow --no-folding .
```

#### Add an existing non-tracked file

To track an existing file in the home directory, create an empty file in this project as if the project root were the home directory. Then run:

```console
dot adopt

# This will run: stow --adopt .
```

#### Pull changes

```console
dot pull

# This will do a git pull of the dotfiles repo and then run sync
```

### Use brew bundle

Use `brew bundle [-g] [add|remove|cleanup|install]` to manage installations via brew, so the brewfile is automatically updates. [Read more][brew]

- Run inside `~/Developer/[profile]` to install for the current machine
- Run with `-g` to install for all machines

[brew]: https://docs.brew.sh/Manpage#bundle-subcommand

### macOS Settings

To backup the current macos settings, run:

```console
prefs-export --output-directory ~/.config/defaults
```

Then look into the output directory's `exec-defaults.sh` file and copy the defaults to `macos.sh`.

## Background

I can run those dotfiles on different machines with different configurations based on the `FISH_PROFILE_NAME` environment variable.

I use Homebrew (via brew bundle) for everything where I just want the latest version.

I use mise for stuff where I'm interested in a specific version, or for global npm packages.