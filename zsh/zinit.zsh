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

# Load plugins which can't use Turbo mode.
#
# Aloxaf/fzf-tab: tab completion with fzf as completion menu (does not work with turbo)
# trapd00r/LS_COLORS: color mappings for files depending on type (required by fzf-tab)
# redxtech/zsh-asdf-direnv: asdf-direnv integration (direnv isn't applied on load with turbo)
zinit light-mode for \
    Aloxaf/fzf-tab \
    redxtech/zsh-asdf-direnv \
  atclone"dircolors -b LS_COLORS > clrs.zsh" \
  atpull'%atclone' pick"clrs.zsh" nocompile'!' \
  atload'zstyle ":completion:*" list-colors “${(s.:.)LS_COLORS}”' \
    trapd00r/LS_COLORS

# A bunch of plugins, Tubro mode.
#
# torifat/npms: browse npm scripts of package.json
# icatalina/zsh-navi-plugin: adds navi_widget function for navi
# trystan2k/zsh-tab-title: directory in terminal title
# zsh-users/zsh-history-substring-search: navigate up/down through history matches while typing
# remino/omz-plugin-git-aliases: Alias all git aliases with g<alias>
# MikeDacre/cdbk: cd bookmarks
# zdharma-continuum/fast-syntax-highlighting: highlight commands
# zsh-users/zsh-autosuggestions: fish-like autosuggestions while typing
# cantino/mcfly: ctrl-r history on steroids
zinit lucid wait for \
    torifat/npms \
    trystan2k/zsh-tab-title \
    icatalina/zsh-navi-plugin \
    zsh-users/zsh-history-substring-search \
    remino/omz-plugin-git-aliases \
    MikeDacre/cdbk \
  atinit"ZINIT[COMPINIT_OPTS]=-C; zicompinit; zicdreplay" \
    zdharma-continuum/fast-syntax-highlighting \
  atload"!_zsh_autosuggest_start" \
    zsh-users/zsh-autosuggestions \
  from"gh-r" as"program" atload'eval "$(mcfly init zsh)"' \
    cantino/mcfly

# completions
zi wait lucid blockf atload"zicompinit; zicdreplay" for \
    zsh-users/zsh-completions \
    MenkeTechnologies/zsh-more-completions \
    g-plane/pnpm-shell-completion \
    g-plane/zsh-yarn-autocompletions \
    jscutlery/nx-completion \
    'https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/asdf/asdf.plugin.zsh'

# bins
zinit wait"1" lucid from"gh-r" as"null" for \
    sbin"fzf"          junegunn/fzf-bin \
    sbin"**/fd"        @sharkdp/fd \
    sbin"**/bat"       @sharkdp/bat \
    sbin"exa* -> exa"  ogham/exa

# Local files
zinit is-snippet for \
    ~/dotfiles/zsh/aliases.zsh \
    ~/dotfiles/zsh/config.zsh \
    ~/dotfiles/zsh/keybindings.zsh \
    ~/dotfiles/zsh/locale.zsh \
    ~/dotfiles/zsh/path.zsh \
    ~/dotfiles/zsh/tools.zsh \
    ~/dotfiles/zsh/zstyle.zsh \
  blockf \
    ~/dotfiles/zsh/completions.zsh