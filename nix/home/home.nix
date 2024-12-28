{ config, pkgs, inputs, ... }:
let
  # Installing global npm packages (if I need them) to the home directory.
  # I usually don't use them anyways, or they're not really important.
  # See also: https://nixos.wiki/wiki/Node.js#Install_to_your_home
  npm_global_path = "$HOME/.npm-global";
in
{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "timomeh";
  home.homeDirectory = "/Users/timomeh";

  # Enable and configure programs that are included in home-manager
  programs = {
    direnv.enable = true;
    direnv.nix-direnv.enable = true;

    dircolors.enable = true;
    dircolors.settings = {
      ".di" = "4;59"; # directory color override
    };

    bat.enable = true;
    eza.enable = true;
    home-manager.enable = true;
    fd.enable = true;
    fzf.enable = true;
    jq.enable = true;
    less.enable = true;
    thefuck.enable = true;

    gh.enable = true;
    gh.settings = {
      git_protocol = "ssh";
      prompt = "enabled";
      aliases = {
        co = "pr checkout";
        pv = "pr view";
      };
    };

    zoxide.enable = true;
    zoxide.options = ["--cmd cd"];

    navi.enable = true;
    navi.settings = {
      cheats = {
        paths = [
          "~/Library/Application Support/navi"
          "~/.config/navi_cheats" # symlinked to /navi_cheats, see below
        ];
      };
      shell = {
        command = "zsh";
      };
    };

    git = import ./git.nix {inherit config pkgs;};
    starship = import ./starship.nix {inherit config pkgs;};
    mcfly = import ./mcfly.nix {inherit config pkgs;};
    zsh = import ./zsh.nix {inherit config pkgs;};
  };

  # manages $PATH
  home.sessionPath = [
    "${npm_global_path}/bin"
    "/Users/timomeh/.local/bin"
  ];

  home.sessionVariables = {
    # I'm managing npm config in environment variables because ~/.npmrc includes
    # secret tokens. All npm config goes into `npm_config_` environment variables.
    # The ~/.npmrc will be only treated for accounts and is not managed by nix.
    npm_config_prefix = npm_global_path;
  };

  # Packages that should be installed to the user profile.
  home.packages = [
    pkgs.pingu
  ];

  home.file.".config/navi_cheats".source = ./navi_cheats;
  home.file.".local/bin/gigs".source = ./bin/gigs;
  home.file.".local/bin/gurl".source = ./bin/gurl;

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "24.05";

  services.gpg-agent = {
    enable = true;
    defaultCacheTtl = 1800;
    enableSshSupport = true;
  };
}