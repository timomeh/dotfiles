{ config, pkgs, ... }: {
  enable = true;
  history = {
    size = 10000;
    path = "${config.xdg.dataHome}/zsh/history";
    ignoreDups = true;
    ignoreAllDups = true;
    ignoreSpace = true;
    share = true;
    expireDuplicatesFirst = true;
  };

  dirHashes = {
    d = "$HOME/Developer";
    g = "$HOME/Developer/gigs";
    dot = "$HOME/dotfiles";
  };

  autosuggestion = {
    enable = true;
  };

  syntaxHighlighting = {
    enable = true;
  };

  historySubstringSearch = {
    enable = true;
  };

  # enable profiling
  # zprof.enable = true;

  shellAliases = {
    tailscale = "/Applications/Tailscale.app/Contents/MacOS/Tailscale";
    pn = "pnpm";
    ping = "pingu";
    ls = "eza --group-directories-first";
    ll = "ls -l --git"; # Long format, git status
    l = "ll -a"; # Long format, all files
    lr = "ll -T"; # Long format, recursive as a tree
    lx = "ll -sextension"; # Long format, sort by extension
    lk = "ll -ssize"; # Long format, largest file size last
    lt = "ll -smodified"; # Long format, newest modification time last
    lc = "ll -schanged"; # Long format, newest status change (ctime) last
    gclogin = "gcloud auth login --update-adc";
  };

  sessionVariables = {
    LC_ALL = "en_US.UTF-8";
    LANG = "en_US.UTF-8";
    LESS = "-F -g -i -M -R -S -w -X -z-4";
    THEFUCK_PRIORITY = "git_hook_bypass=1100";
    EDITOR = "code --wait";
    ZSH_DISABLE_COMPFIX = true;
    HOMEBREW_NO_ANALYTICS = true;
  };

  defaultKeymap = "emacs";

  plugins = [
    {
      name = "powerlevel10k";
      src = pkgs.zsh-powerlevel10k;
      file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
    }
  ];

  initExtra = ''
    setopt globdots
    setopt auto_pushd # Make cd push the old directory to the directory stack.
    setopt no_bg_nice # Prevent background jobs being given a lower priority.
    setopt no_check_jobs # Prevent status report of jobs on shell exit.
    setopt no_hup # Prevent SIGHUP to jobs on shell exit.

    # https://github.com/sindresorhus/guides/blob/master/how-not-to-rm-yourself.md
    unsetopt rm_star_silent
    setopt rm_star_wait

    bindkey '^n' _navi_widget

    [[ ! -f ${./p10k.zsh} ]] || source ${./p10k.zsh}

    # zstyle default stolen here:
    # https://www.reddit.com/r/zsh/comments/1874tlq/comment/kbdsxwu/

    # apply ls colors
    zstyle ':completion:*:default' list-colors ''${(s.:.)LS_COLORS}
    zstyle ':completion:*:default' list-prompt '%S%M matches%s'

    # pretty cd [tab] stuffs
    zstyle ':completion:*:directory-stack' list-colors '=(#b) #([0-9]#)*( *)==95=38;5;12'

    # highlight case in select
    zstyle ':completion:*' menu select

    # Use caching to make completion for commands such as dpkg and apt usable.
    zstyle ':completion::complete:*' use-cache on
    zstyle ':completion::complete:*' cache-path "$HOME/.zcompcache"

    # case insensitive path-completion
    zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
    unsetopt CASE_GLOB

    # Group matches and describe.
    zstyle ':completion:*:*:*:*:*' menu select
    zstyle ':completion:*:matches' group 'yes'
    zstyle ':completion:*:options' description 'yes'
    zstyle ':completion:*:options' auto-description '%d'
    zstyle ':completion:*:corrections' format ' %F{green}-- %d (errors: %e) --%f'
    zstyle ':completion:*:messages' format ' %F{purple} -- %d --%f'
    zstyle ':completion:*:warnings' format ' %F{red}-- no matches found --%f'
    zstyle ':completion:*' group-name '''
    zstyle ':completion:*' verbose yes

    # Fuzzy match mistyped completions.
    zstyle ':completion:*' completer _complete _match _approximate
    zstyle ':completion:*:match:*' original only
    zstyle ':completion:*:approximate:*' max-errors 1 numeric

    # Increase the number of errors based on the length of the typed word. But make
    # sure to cap (at 7) the max-errors to avoid hanging.
    zstyle -e ':completion:*:approximate:*' max-errors 'reply=($((($#PREFIX+$#SUFFIX)/3>7?7:($#PREFIX+$#SUFFIX)/3))numeric)'

    # Don't complete unavailable commands.
    zstyle ':completion:*:functions' ignored-patterns '(_*|pre(cmd|exec))'

    # Array completion element sorting.
    zstyle ':completion:*:*:-subscript-:*' tag-order indexes parameters

    # Directories
    zstyle ':completion:*:*:cd:*' tag-order local-directories directory-stack path-directories
    zstyle ':completion:*:*:cd:*:directory-stack' menu yes select
    zstyle ':completion:*:-tilde-:*' group-order 'named-directories' 'path-directories' 'users' 'expand'
    zstyle ':completion:*' squeeze-slashes true

    # History
    zstyle ':completion:*:history-words' stop yes
    zstyle ':completion:*:history-words' remove-all-dups yes
    zstyle ':completion:*:history-words' list false
    zstyle ':completion:*:history-words' menu yes

    # Environment Variables
    zstyle ':completion::*:(-command-|export):*' fake-parameters ''${''${''${_comps[(I)-value-*]#*,}%%,*}:#-*-}

    # Populate hostname completion. But allow ignoring custom entries from static
    # */etc/hosts* which might be uninteresting.
    zstyle -e ':completion:*:hosts' hosts 'reply=(
      ''${=''${=''${=''${''${(f)"$(cat {/etc/ssh/ssh_,~/.ssh/}known_hosts(|2)(N) 2> /dev/null)"}%%[#| ]*}//\]:[0-9]*/ }//,/ }//\[/ }
      ''${=''${(f)"$(cat /etc/hosts(|)(N) <<(ypcat hosts 2> /dev/null))"}%%(\#''${_etc_host_ignores:+|''${(j:|:)~_etc_host_ignores}})*}
      ''${=''${''${''${''${(@M)''${(f)"$(cat ~/.ssh/config 2> /dev/null)"}:#Host *}#Host }:#*\**}:#*\?*}}
    )'

    # Don't complete uninteresting users...
    zstyle ':completion:*:*:*:users' ignored-patterns \
          adm amanda apache avahi beaglidx bin cacti canna clamav daemon \
          dbus distcache dovecot fax ftp games gdm gkrellmd gopher \
          hacluster haldaemon halt hsqldb ident junkbust ldap lp mail \
          mailman mailnull mldonkey mysql nagios \
          named netdump news nfsnobody nobody nscd ntp nut nx openvpn \
          operator pcap postfix postgres privoxy pulse pvm quagga radvd \
          rpc rpcuser rpm shutdown squid sshd sync uucp vcsa xfs '_*'

    # Ignore multiple entries.
    zstyle ':completion:*:(rm|kill|diff):*' ignore-line other
    zstyle ':completion:*:rm:*' file-patterns '*:all-files'

    # Kill
    zstyle ':completion:*:*:*:*:processes' command 'ps -u $LOGNAME -o pid,user,command -w'
    zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;36=0=01'
    zstyle ':completion:*:*:kill:*' menu yes select
    zstyle ':completion:*:*:kill:*' force-list always
    zstyle ':completion:*:*:kill:*' insert-ids single

    # Man
    # enable completion on manual page
    zstyle ':completion:*:manuals'    separate-sections true
    zstyle ':completion:*:manuals.*'  insert-sections   true
    zstyle ':completion:*:man:*'      menu yes select

    # SSH/SCP/RSYNC
    zstyle ':completion:*:(ssh|scp|rsync):*' tag-order 'hosts:-host:host hosts:-domain:domain hosts:-ipaddr:ip\ address *'
    zstyle ':completion:*:(scp|rsync):*' group-order users files all-files hosts-domain hosts-host hosts-ipaddr
    zstyle ':completion:*:ssh:*' group-order users hosts-domain hosts-host users hosts-ipaddr
    zstyle ':completion:*:(ssh|scp|rsync):*:hosts-host' ignored-patterns '*(.|:)*' loopback ip6-loopback localhost ip6-localhost broadcasthost
    zstyle ':completion:*:(ssh|scp|rsync):*:hosts-domain' ignored-patterns '<->.<->.<->.<->' '^[-[:alnum:]]##(.[-[:alnum:]]##)' '*@*'
    zstyle ':completion:*:(ssh|scp|rsync):*:hosts-ipaddr' ignored-patterns '^(<->.<->.<->.<->|(|::)([[:xdigit:].]##:(#c,2))##(|%*))' '127.0.0.<->' '255.255.255.255' '::1' 'fe80::*'

    # partial completion suggestions
    zstyle ':completion:*' list-suffixes
    zstyle ':completion:*' expand prefix suffix

    ## zstyle specific to fzf-tab
    # https://github.com/Aloxaf/fzf-tab/wiki/Configuration

    # Show ./ and ../ in completion. Needs setopt globdots
    zstyle ':completion:*' special-dirs true

    # disable sort when completing `git checkout`
    zstyle ':completion:*:git-checkout:*' sort false
    # set descriptions format to enable group support
    # NOTE: don't use escape sequences here, fzf-tab will ignore them
    zstyle ':completion:*:descriptions' format '[%d]'
    # set list-colors to enable filename colorizing
    zstyle ':completion:*' list-colors ''${(s.:.)LS_COLORS}
    # force zsh not to show completion menu, which allows fzf-tab to capture the unambiguous prefix
    zstyle ':completion:*' menu no
    # preview directory's content with eza when completing cd
    zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath'
    # switch group using `<` and `>`
    zstyle ':fzf-tab:*' switch-group '<' '>'

    # preview environment variables
    zstyle ':fzf-tab:complete:(-command-|-parameter-|-brace-parameter-|export|unset|expand):*' \
      fzf-preview 'echo ''${(P)word}'

    # preview git
    zstyle ':fzf-tab:complete:git-(add|diff|restore):*' fzf-preview \
      'git diff $word | delta'
    zstyle ':fzf-tab:complete:git-log:*' fzf-preview \
      'git log --color=always $word'
    zstyle ':fzf-tab:complete:git-help:*' fzf-preview \
      'git help $word | bat -plman --color=always'
    zstyle ':fzf-tab:complete:git-show:*' fzf-preview \
      'case "$group" in
      "commit tag") git show --color=always $word ;;
      *) git show --color=always $word | delta ;;
      esac'
    zstyle ':fzf-tab:complete:git-checkout:*' fzf-preview \
      'case "$group" in
      "modified file") git diff $word | delta ;;
      "recent commit object name") git show --color=always $word | delta ;;
      *) git log --color=always $word ;;
      esac'

    # preview brew
    zstyle ':fzf-tab:complete:brew-(install|uninstall|search|info):*-argument-rest' fzf-preview 'brew info $word'

    # preview files
    zstyle ':fzf-tab:complete:*:*' fzf-preview 'less ''${(Q)realpath}'
    zstyle ':fzf-tab:complete:-command-:*' fzf-preview \
      '(out=$(tldr --color always "$word") 2>/dev/null && echo $out) || (out=$(MANWIDTH=$FZF_PREVIEW_COLUMNS man "$word") 2>/dev/null && echo $out) || (out=$(which "$word") && echo $out) || echo "''${(P)word}"'

    # preview pnpm: packages and scripts
    zstyle ':fzf-tab:complete:pnpm:values' fzf-preview \
      'case "$group" in
      "[deps]") pnpm ls $word --color=always ;;
      "[scripts]") pnpm pkg get scripts.$word --color=always | sed "s/^{\\(.*\\)}\$/\\1/; s/^\"\\(.*\\)\"\$/\\1/" ;;
      esac'

    # preview npm: packages and scripts
    zstyle ':fzf-tab:complete:npm:*' fzf-preview \
      'case "$words[2]" in
      "r" | "uninstall") npm list $word --depth=0 --color=always ;;
      "i" | "install") npm view $word --color=always ;;
      "run") npm view $word --color=always ;;
      esac'

    # preview yarn: packages and scripts
    zstyle ':fzf-tab:complete:yarn:*' fzf-preview \
      'case "$words[2]" in
      "remove") yarn list $word --depth=0 --silent 2> >(grep -v warning 1>&2) ;;
      "add") npm view $word --color=always ;;
      "" | "run" | "r") npm pkg get scripts.$word --color=always | sed "s/^{\\(.*\\)}\$/\\1/; s/^\"\\(.*\\)\"\$/\\1/" ;;
      esac'
    
    _git_aliases() {
      alias | grep -E '^g' | grep -E "='git "
    }

    _git_aliases_set() {
      alias g=git
      alias git-aliases="_git_aliases"

      git config --get-regexp 'alias\..' | sed 's/^alias\.//' | while read name cmd
      do
        alias g$name="git $name"
      done
    }

    _git_aliases_set
  '';
}