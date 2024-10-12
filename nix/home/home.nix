{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "timomeh";
  home.homeDirectory = "/Users/timomeh";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  home.file.".config/navi_cheats".source = ./navi_cheats;
  home.file.".local/bin/gigs".source = ./bin/gigs;
  home.file.".local/bin/gurl".source = ./bin/gurl;
  
  home.file.".gitignore_global".text = ''
    .tool-versions
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

  programs = {
    bat = import ./bat.nix {inherit config pkgs;};
    eza = import ./eza.nix {inherit config pkgs;};
    fd = import ./fd.nix {inherit config pkgs;};
    fzf = import ./fzf.nix {inherit config pkgs;};
    dircolors = import ./dircolors.nix {inherit config pkgs;};
    git = import ./git.nix {inherit config pkgs;};
    gh = import ./gh.nix {inherit config pkgs;};
    jq = import ./jq.nix {inherit config pkgs;};
    mcfly = import ./mcfly.nix {inherit config pkgs;};
    navi = import ./navi.nix {inherit config pkgs;};
    starship = import ./starship.nix {inherit config pkgs;};
    thefuck = import ./thefuck.nix {inherit config pkgs;};
    zoxide = import ./zoxide.nix {inherit config pkgs;};
    zsh = import ./zsh.nix {inherit config pkgs;};
  };

  # Packages that should be installed to the user profile.
  home.packages = [
    pkgs.pingu
  ];

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