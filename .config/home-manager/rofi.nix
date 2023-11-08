{ config, pkgs, lib, ... }:

{
  programs.rofi = {
    enable = true;
    theme = "gruvbox-dark";
  };
}
