{ config, pkgs, ... }:

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
    mise = import ./mise.nix {inherit config pkgs;};
    zsh = import ./zsh.nix {inherit config pkgs;};
  };

  # Packages that should be installed to the user profile.
  home.packages = [
    pkgs.pingu
  ];

  home.file.".config/navi_cheats".source = ./navi_cheats;
  home.file.".local/bin/gigs".source = ./bin/gigs;
  home.file.".local/bin/gurl".source = ./bin/gurl;

  home.file.".finicky.js".text = ''
    // Use https://finicky-kickstart.now.sh to generate basic configuration
    // Learn more about configuration options: https://github.com/johnste/finicky/wiki/Configuration

    module.exports = {
      defaultBrowser: "Arc",
      handlers: [
        // always open Google Cloud as Gigs
        {
          match: ({ url }) => url.host.includes('cloud.google.com'),
          browser: { 
            name: "Arc",
            profile: "Work"
          }
        },

        // always open Google Meet as Gigs
        {
          match: ({ url }) => url.host.includes('meet.google.com'),
          browser: { 
            name: "Arc",
            profile: "Work"
          }
        }
      ],
    }
  '';

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