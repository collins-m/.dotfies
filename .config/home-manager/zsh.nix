{ config, pkgs, lib, ... }:

{
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = true;
    shellAliases = {
      dotfiles = "git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME";
      full-switch = "sudo nixos-rebuild switch --flake . && home-manager switch --flake . ; systemctl --user reset-failed";
      home-switch = "home-manager switch --flake . ; systemctl --user reset-failed";
    };
    initExtra = ''
      unsetopt beep

      # pure-prompt theme
      autoload -U prompinit; promptinit
      prompt pure
    '';
  };
}
