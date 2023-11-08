{ config, pkgs, lib, ... }: let
  editor = "nvim";
in {
  imports = [
    ./zsh.nix
    ./kitty.nix
    ./rofi.nix
    ./swaylock.nix
  ];

  home.username = "maidhc";
  home.homeDirectory = "/home/maidhc";
  home.stateVersion = "23.05";
  home.packages = with pkgs; [
    neofetch
    neovim
    firefox
    fzf
  ];

  home.file = {
  };
  home.sessionVariables = {
    EDITOR = "${editor}";
  };
  programs.git = {
    enable = true;
    userName = "collins-m";
    userEmail = "github.5mwzw@reroutemail.com";
  };
}
