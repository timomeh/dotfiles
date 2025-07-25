# dotfiles

Dotfiles. Mainly centered around 🐟 fish, 🐐 stow, 🍺 brew and 🧑‍🍳 mise.

## Features

- `cd` is zoxide
- `ls` is eza
- `ping` is pingu, noot noot
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

### Tracking dotfiles

To link a new dotfile, create it inside this project as if the project root were the home directory. Then run:

```console
stow .
```

When adding a new directory which doesn't exist yet, use the `--no-folding` flag to make sure that it only symlinks files but no directories, unless you want to symlink a whole directory.

To track an existing file in the home directory, create an empty file in this project as if the project root were the home directory. Then run:

```console
stow --adopt .
```

It will copy the contents and link it.

### Use brew bundle

Use `brew bundle [add|remove|cleanup|install]` to manage installations via brew, so the brewfile is automatically updated. [Read more][brew]

```sh
bb add [formulae]
bb install
bb remove [formulae]
bb cleanup [--force]
```

[brew]: https://docs.brew.sh/Manpage#bundle-subcommand

### macOS Settings

To backup the current macos settings, run:

```console
prefs-export --output-directory ~/.config/defaults
```

Then look into the output directory's `exec-defaults.sh` file and copy the defaults to `macos.sh`.

## Background

- [**stow**](https://www.gnu.org/software/stow/) manages symlinks to sync and backup dotfiles.
- [**fish**](https://fishshell.com/) is a fast and easy to configure shell with many batteries included, so it doesn't need crazy setups like zsh does.
- [**brew**](https://brew.sh/) installs tools that I may use globally and/or when I don't care about the versions and just want the latest.
- [**mise**](https://mise.jdx.dev/) also installs tools but I use it for stuff that is specific to a project (like different runtime versions), and I want to automatically switch it depending on the current working directory.

I usually use CLI tools instead of IDE tools or GUIs, but I still like to use vscode as my code editor. I use the terminal in vscode in combination with a global hotkey terminal with Ghostty. I'm usually using git or running tests in the editor's terminal, and use the external terminal for anything else.

I often define my own aliases and shortcuts based on my own mnemonics, so they're all a bit non-standard, but they work for me. I like to use my keyboard to navigate around, but I'm also not afraid to touch my mouse. It just depends on what I'm currently doing. When I'm reading text or code, I have a habit of selecting a chunk of text with my mouse as I read, so I'm on my mouse from time to time anyway.

I use raycast, contexts and rectangle pro a lot. Because I'm often using cli tools, I use a lot of completions, history, fuzzy finding and other stuff to make CLIs more productive. Not everything can be synced to my dotfiles though.