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

zinit snippet OMZ::plugins/git/git.plugin.zsh

zinit ice atclone"dircolors -b LS_COLORS > clrs.zsh" \
    atpull'%atclone' pick"clrs.zsh" nocompile'!' \
    atload'zstyle ":completion:*" list-colors “${(s.:.)LS_COLORS}”'
zinit light trapd00r/LS_COLORS

zinit wait lucid for \
 atinit"ZINIT[COMPINIT_OPTS]=-C; zicompinit; zicdreplay" \
    zdharma-continuum/fast-syntax-highlighting \
 blockf \
    zsh-users/zsh-completions \
 atload"!_zsh_autosuggest_start" \
    zsh-users/zsh-autosuggestions

zinit ice lucid nocompile wait'0e' nocompletions
zinit load MenkeTechnologies/zsh-more-completions

zinit ice atload"zpcdreplay" atclone"./zplug.zsh" atpull"%atclone" atinit"zpcompinit; zpcdreplay"
zinit light g-plane/pnpm-shell-completion

zinit ice atload"zpcdreplay" atclone'./zplug.zsh'
zinit light g-plane/zsh-yarn-autocompletions

zinit wait"1" lucid from"gh-r" as"null" for \
     sbin"fzf"          junegunn/fzf-bin \
     sbin"**/fd"        @sharkdp/fd \
     sbin"**/bat"       @sharkdp/bat \
     sbin"exa* -> exa"  ogham/exa

zinit light torifat/npms
zinit light redxtech/zsh-asdf-direnv
zinit light icatalina/zsh-navi-plugin
zinit light trystan2k/zsh-tab-title

zinit load zsh-users/zsh-history-substring-search
zinit ice wait atload'_history_substring_search_config'

zinit ice wait"2" lucid as"program" pick"bin/git-dsf"
zinit light zdharma-continuum/zsh-diff-so-fancy

zinit ice lucid wait"0a" from"gh-r" as"program" atload'eval "$(mcfly init zsh)"'
zinit light cantino/mcfly

zinit snippet 'https://github.com/remino/omz-plugin-git-aliases/blob/main/git-aliases.plugin.zsh'
zinit snippet 'https://github.com/MikeDacre/cdbk/blob/master/cdbk.plugin.zsh'
zinit snippet 'https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/asdf/asdf.plugin.zsh'
zinit snippet 'https://github.com/jscutlery/nx-completion/blob/main/nx-completion.plugin.zsh'