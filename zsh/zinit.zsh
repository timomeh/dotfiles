### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk

# Notes to self:
# 
# zinit's `for` syntax works like this
# - All flags before `for` are applied to all plugins
# - You can list multiple plugins after `for`
# - When a flag is after `for`, it's applied only to the next plugin
# - zinit automatically detects what's a flag and what's a plugin
#
# Use `zinit times` to debug loading times
#
# Requires packages installed via brew:
# thefuck
# eza

zinit pack for ls_colors

# prompt
zinit ice from"gh-r" as"command" atload'eval "$(starship init zsh)"'
zinit load starship/starship

# initialize thefuck some time
zinit ice atload'eval "$(thefuck --alias)"'

# Install hook for asdf direnv
zinit ice link
zinit snippet ~/dotfiles/zsh/asdf_direnv.zsh

# Load plugins which can't use Turbo mode.
# fzf-tab simply won't work
# asdf-direnv needs to be loaded immediately, otherwise the env vars aren't
# populated when opening a new session
zinit light-mode for \
    Aloxaf/fzf-tab \
  atinit:'export ASDF_DIR="$PWD"' \
  atclone:'_zini_asdf_install' \
  src:'asdf.sh' \
  multisrc:'asdf_direnv_hook.zsh' \
  depth:1 \
    @asdf-vm/asdf

# A bunch of plugins, loaded with Tubro mode.
#
# npms: browse npm scripts of package.json
# zsh-navi-plugin: adds navi_widget function for navi
# zsh-tab-title: directory in terminal title
# zsh-history-substring-search: navigate up/down through history matches while typing
# omz-plugin-git-aliases: Alias all git aliases with g<alias>
# cdbk: cd bookmarks
# zsh-zoxide: smarter cd which remembers directories so you can jump to them
# fast-syntax-highlighting: highlight commands
# zsh-autosuggestions: fish-like autosuggestions while typing
# mcfly: ctrl-r history on steroids
zinit lucid for \
    torifat/npms \
    trystan2k/zsh-tab-title \
    icatalina/zsh-navi-plugin \
    zsh-users/zsh-history-substring-search \
    remino/omz-plugin-git-aliases \
    MikeDacre/cdbk \
  atinit"_ZO_CMD_PREFIX=cd" \
    z-shell/zsh-zoxide \
  atinit"ZINIT[COMPINIT_OPTS]=-C; zicompinit; zicdreplay" \
    zdharma-continuum/fast-syntax-highlighting \
  atload"!_zsh_autosuggest_start" \
    zsh-users/zsh-autosuggestions \
  from"gh-r" as"program" atload'eval "$(mcfly init zsh)"' \
    cantino/mcfly

# completions
zi wait lucid blockf atload"zicompinit; zicdreplay" for \
    zsh-users/zsh-completions \
  nocompile nocompletions \
    MenkeTechnologies/zsh-more-completions \
  atclone"./zplug.zsh" atpull"%atclone" \
    g-plane/pnpm-shell-completion \
  atload"zpcdreplay" atclone'./zplug.zsh' \
    g-plane/zsh-yarn-autocompletions \
    jscutlery/nx-completion

# bins
zinit wait"1" lucid from"gh-r" as"null" for \
    sbin"fzf"          junegunn/fzf-bin \
    sbin"**/fd"        @sharkdp/fd \
    sbin"**/bat"       @sharkdp/bat

# Local files
# These could also simply be sourced, but loading them via zinit allows me to
# inspect their loading times with `zinit times`.
zinit is-snippet link for \
    ~/dotfiles/zsh/aliases.zsh \
    ~/dotfiles/zsh/config.zsh \
    ~/dotfiles/zsh/keybindings.zsh \
    ~/dotfiles/zsh/locale.zsh \
    ~/dotfiles/zsh/path.zsh \
    ~/dotfiles/zsh/tools.zsh \
    ~/dotfiles/zsh/zstyle.zsh \
  blockf \
    ~/dotfiles/zsh/completions.zsh