{
  description = "Darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, nix-homebrew, home-manager }:
  let
    configuration = { pkgs, config, ... }: {

      nixpkgs.config.allowUnfree = true;

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
          pkgs.starship
          pkgs.zoxide
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
          "ccat"
        ];
        masApps = {
          "System Color Picker" = 1545870783;
          "Pandan" = 1569600264;
          "Pixelmator Pro" = 1289583905;
        };
        # onActivation.cleanup = "zap";
        onActivation.autoUpdate = true;
        onActivation.upgrade = true;
      };

      users.users.timomeh = {
        name = "timomeh";
        home = "/Users/timomeh";
      };

      # Create /etc/zshrc that loads the nix-darwin environment.
      programs.zsh.enable = true;  # default shell on catalina
      # programs.fish.enable = true;

      home-manager.backupFileExtension = "backup";

      # Auto upgrade nix package and the daemon service.
      services.nix-daemon.enable = true;
      # nix.package = pkgs.nix;

      # Necessary for using flakes on this system.
      nix.settings.experimental-features = "nix-command flakes";

      # build users that are not currently in the system
      nix.configureBuildUsers = true;

      # Set Git commit hash for darwin-version.
      system.configurationRevision = self.rev or self.dirtyRev or null;

      system.activationScripts.applications.text = let
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

      # Used for backwards compatibility, please read the changelog before changing.
      # $ darwin-rebuild changelog
      system.stateVersion = 5;

      # The platform the configuration will be used on.
      nixpkgs.hostPlatform = "aarch64-darwin";
    };
  in
  {
    # Build darwin flake using:
    # $ darwin-rebuild build
    darwinConfigurations."Timos-MacBook-Pro" = nix-darwin.lib.darwinSystem {
      system = "aarch64-darwin";

      modules = [
        configuration
        nix-homebrew.darwinModules.nix-homebrew
        {
          nix-homebrew = {
            enable = true;
            # Apple Silicon Only
            enableRosetta = true;
            # User owning the Homebrew prefix
            user = "timomeh";
            # Automatically migrate existing Homebrew installations
            autoMigrate = true;
          };
        }
        home-manager.darwinModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.timomeh = import ./home/home.nix;
        }
      ];
    };

    # Expose the package set, including overlays, for convenience.
    darwinPackages = self.darwinConfigurations."Timos-MacBook-Pro".pkgs;
  };
}
