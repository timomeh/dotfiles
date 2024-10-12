{ config, pkgs, ... }: {
  enable = true;
  fzf.enable = true;
  interfaceView = "TOP";
  settings = {
    colors = {
      menubar = {
        bg = "black";
        fg = "red";
      };
      darkmode = {
        prompt = "cyan";
        timing = "yellow";
        results_selection_fg = "cyan";
        results_selection_bg = "black";
        results_selection_hl = "red";
      };
    };
  };
}