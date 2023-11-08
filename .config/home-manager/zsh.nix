{ config, pkgs, lib, ... }:

{
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = true;
    shellAliases = {
      dotfiles = "${pkgs.git}/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME";
    };
    initExtra = ''
      unsetopt beep

      # pure-prompt theme
      autoload -U prompinit; promptinit
      prompt pure
    '';
  };
}
