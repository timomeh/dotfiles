# dotfiles

Dotfiles, without symlinking or stuff. Just plain dotfiles and configurations.

## Background

I've set this repo up according to [this HN thread](https://news.ycombinator.com/item?id=11071754).

```sh
git init --bare $HOME/.dotfiles
alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
dotfiles config --local status.showUntrackedFiles no
```

## Usage

`dotfiles` is an alias to the git in my home directory. (see above)

So stuff like `dotfiles status`, `dotfiles add`, `dotfiles commit` is available.

### Move to a new machine

It's just a Git Repo. But you can't clone into a directory with existing files, like macOS will write some files into the home directory.

1. Clone into a directory with a seperate git directory and a temporary directory as working tree.
   ```sh
   git clone --separate-git-dir=$HOME/.dotfiles git@github.com:timomeh/dotfiles.git $HOME/dotfiles-tmp
   ```

2. Copy the working tree from the tmp directory into the home directory.
   ```sh
   cp -r ~/dotfiles-tmp/. ~
   ```

3. Delete the tmp dotfiles directory.
   ```sh
   rm -rf ~/dotfiles-tmp/
   ```

4. Add the dotfiles-git alias to the current shell.  
   ```sh
   alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
   ```

5. Don't show untracked files.
   ```sh
   dotfiles config --local status.showUntrackedFiles no
   ```

## Features

- zsh with [zplug](https://github.com/zplug/zplug)
- Atom configurations
- Hyper configurations
- Git configs
- macOS Settings
