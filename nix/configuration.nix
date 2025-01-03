{ config, pkgs, inputs, self, ... }:

{
  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages =
    [
      pkgs.mkalias
      pkgs.dive
      pkgs.entr
      pkgs.ffmpeg
      pkgs.terraform
      pkgs.google-cloud-sdk
      pkgs.vscode
      pkgs.karabiner-elements
      pkgs.monitorcontrol
      pkgs.raycast
      pkgs.nodejs_20
      pkgs.corepack
    ];
  
  fonts.packages =
    [
      pkgs.fira-code
      pkgs.noto-fonts
      (pkgs.nerdfonts.override { fonts = [ "FiraCode" "Hack" ]; })
    ];
  
  homebrew = {
    enable = true;
    casks = [
      "cleanshot"
      "contexts"
      "firefox"
      "google-chrome"
      "google-drive"
      "gpg-suite"
      "iterm2"
      "mimestream"
      # "rectangle-pro"
      "sf-symbols"
      "slack"
      "spotify"
      "sublime-text"
      "telegram"
      "visual-studio-code"
      "whatsapp"
      "zoom"
      # "docker"
      # "finicky"
      # "proxyman"
    ];
    brews = [
      # "something"
    ];
    masApps = {
      "System Color Picker" = 1545870783;
      "Pandan" = 1569600264;
      "Pixelmator Pro" = 1289583905;
    };

    # Delete everything from brew which isn't specified
    # onActivation.cleanup = "zap";

    onActivation.autoUpdate = true;
    onActivation.upgrade = true;
  };

  users.users.timomeh = {
    name = "timomeh";
    home = "/Users/timomeh";
  };

  programs = {
    # Create /etc/zshrc that loads the nix-darwin environment.
    zsh.enable = true;
  };

  services = {
    # Auto upgrade nix package and the daemon service.
    nix-daemon.enable = true;
  };

  home-manager = {
    backupFileExtension = "backup";
  };

  nix = {
    # Necessary for using flakes on this system.
    settings.experimental-features = "nix-command flakes";
  };

  nixpkgs = {
    # It's okay to install unfree packages from nixpkgs
    config.allowUnfree = true;
    # The platform to use
    hostPlatform = "aarch64-darwin";
  };

  system = {
    # Set Git commit hash for darwin-version.
    configurationRevision = self.rev or self.dirtyRev or null;

    # Used for backwards compatibility, please read the changelog before changing.
    # $ darwin-rebuild changelog
    stateVersion = 5;

    # Setup aliases from apps in /Applications/Nix Apps/* to /Applications/*
    activationScripts.applications.text = let
      env = pkgs.buildEnv {
        name = "system-applications";
        paths = config.environment.systemPackages;
        pathsToLink = "/Applications";
      };
    in
      pkgs.lib.mkForce ''
      # Set up applications.
      echo "setting up /Applications..." >&2
      rm -rf /Applications/Nix\ Apps
      mkdir -p /Applications/Nix\ Apps
      find ${env}/Applications -maxdepth 1 -type l -exec readlink '{}' + |
      while read src; do
        app_name=$(basename "$src")
        echo "copying $src" >&2
        ${pkgs.mkalias}/bin/mkalias "$src" "/Applications/Nix Apps/$app_name"
      done
    '';
  };
}