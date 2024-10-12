{ config, pkgs, ... }: {
  enable = true;
  globalConfig = {
    tools = {
      node = ["lts" "20" "18"];
    };
  };
}