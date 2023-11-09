{ config, pkgs, lib, ... }:

{
  programs.swaylock = {
    enable = true;
    settings = {
      color = "282828";
    };
  };
}
