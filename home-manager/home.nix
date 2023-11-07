{ config, pkgs, lib, ... }:

{
  home.username = "maidhc";
  home.homeDirectory = "/home/maidhc";
  home.stateVersion = "23.05";
  home.packages = with pkgs; [
    neovim
    firefox
  ];

  home.file = {
  };
  home.sessionVariables = {
    EDITOR = "nvim";
  };
  programs.git = {
    enable = true;
    userName = "collins-m";
    userEmail = "github.5mwzw@reroutemail.com";
  };
}
