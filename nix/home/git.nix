{ config, pkgs, ... }: {
  enable = true;
  userName = "Timo Mämecke";
  userEmail = "timo@maemecke.com";

  signing = {
    key = "D04120C573EE73EB";
  };

  extraConfig = {
    pull.rebase = true;
    push.default = "simple";
    init.defaultBranch = "main";
    merge.conflictstyle = "diff3";
    core = {
      excludesfile = builtins.toFile "gitignore_global" ''
        .tool-versions
        .envrc
        .direnv
        shell.nix
        *.DS_Store
        .AppleDouble
        .LSOverride
        .vscode
        ._*
        .DocumentRevisions-V100
        .fseventsd
        .Spotlight-V100
        .TemporaryItems
        .Trashes
        .VolumeIcon.icns
        .com.apple.timemachine.donotpresent
        .AppleDB
        .AppleDesktop
        Network Trash Folder
        Temporary Items
        .apdisk
        .tags
      '';
      editor = "code --wait";
      ignorecase = false;
    };
  };

  delta = {
    enable = true;
    options = {
      navigate = true;
    };
  };

  includes = [
    {
      condition = "gitdir:~/Developer/gigs/";
      contents = {
        user.name = "Timo Mämecke";
        user.email = "timo@gigs.com";
      };
    }
  ];

  aliases = {
    lg1 = "log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all";
    lg2 = "log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n''          %C(white)%s%C(reset) %C(dim white)- %an%C(reset)' --all";
    lg = "!git lg1";
    l = "!git lg1";
    wip = "![[ $(git log -1 --pretty=%B) == \"WIP\" ]] && (git reset --soft \"HEAD^\") || (git add . && git commit -m \"WIP\")";

    ps = "push";
    pl = "pull";

    a = "add";
    aa = "add -A";
    c = "commit --verbose";
    ca = "commit -a --verbose";
    cm = "commit -m";
    cam = "commit -a -m";
    m = "commit --amend --verbose";

    cdiff = "!f() { git diff \"$1\"^..\"$1\"; }; f";

    s = "status";

    co = "checkout";
    cob = "checkout -b";
    cof = "checkout --";
    pr = "!f() { git fetch upstream \"pull/$1/head\" && git checkout FETCH_HEAD; }; f";

    housekeeping = "!git branch -vv | grep 'origin/.*: gone]' | awk '{print $1}' | xargs git branch -D";

    wat = "!git config -l | grep alias | cut -c 7-";
  };
}