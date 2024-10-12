{ config, pkgs, ... }: {
  enable = true;
  enableZshIntegration = true;

  settings = {
    ".di" = "4;95";
  };
}