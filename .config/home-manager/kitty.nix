{ config, pkgs, lib, ... }:

{
  programs.kitty = {
    enable = true;
    font = {
      name = "Fira Code";
      package = pkgs.fira-code;
    };
    theme = "Gruvbox Dark";
    extraConfig = ''
      background_opacity 0.85
      confirm_os_window_close 0
    '';
  };
}
