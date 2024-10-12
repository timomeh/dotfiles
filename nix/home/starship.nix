{ config, pkgs, ... }: {
  enable = true;
  settings = {
    add_newline = true;
    format = "$all$fill$time$line_break$character";
    character = {
      error_symbol = "[](bold red)";
      success_symbol = "[](bold blue)";
    };
    gcloud = {
      disabled = true;
    };
    docker_context = {
      disabled = true;
    };
    time = {
      disabled = false;
      format = " $time(bold blue) ";
    };
    fill = {
      style = "bold black";
      symbol = "·";
    };
    directory = {
      style = "bold blue";
    };
  };
}