# dotfiles

## Setup

1. Clone dotfiles:

```sh
git clone git@github.com:timomeh/dotfiles.git ~/dotfiles
```

2. Install mise: https://mise.jdx.dev

```sh
curl https://mise.run | sh
```

3. Bootstrap with mise:

```sh
mise bootstrap --cd ~/dotfiles
```

You may need to trust first:

```sh
mise trust ~/dotfiles
```
