{ config, pkgs, ... }: {
  enable = true;
  enableZshIntegration = true;
  settings = {
    cheats = {
      paths = [
        "~/Library/Application Support/navi"
        "~/.config/navi_cheats"
      ];
    };
    shell = {
      command = "zsh";
    };
  };
}