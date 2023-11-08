{
  description = "NixOS and standalone home-manager flake";

  inputs = {
    # NIxpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  
    # Home manager
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Nix colours
    # nix-colors.url = "github:misterio77/nix-colors";
  };

  outputs = {
    self,
    nixpkgs, 
    home-manager,
    ...
  } @ inputs: let
    inherit (self) outputs;
  in {
    # sudo nixos-rebuild switch --flake .
    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs outputs; };
        modules = [
          ./.config/nixos/configuration.nix
        ];
      };
    };

    # home-manager switch --flake .
    homeConfigurations = {
      "maidhc@nixos" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        extraSpecialArgs = { inherit inputs outputs; };
        modules = [
          ./.config/home-manager/home.nix
        ];
      };
    };
  };
}
