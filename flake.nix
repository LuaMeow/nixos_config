# Flakes are pretty much programming language packages for nix.d
# They have inputs (other flakes they depend on),
# and outputs (an attribute set that depends on the inputs,
# with special names for specific functionality like exposing nixos configurations)
#
# The contents of this file has to be saved as `flake.nix` in the root of your repo to work.

{
  description = "My NixOS configuration";

  # inputs are defined in the input attribute set, and you almost always want to depend on at least nixpkgs
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-26.05";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    sops-nix.url = "github:Mic92/sops-nix";
    sops-nix.inputs.nixpkgs.follows = "nixpkgs";

    plasma-manager = {
      url = "github:nix-community/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
  };

  # outputs is a function taking in the inputs as an attribute set and returning an attribute set with specific attributes
  outputs =
    {
      nixpkgs,
      nixpkgs-stable,
      sops-nix,
      home-manager,
      nur,
      plasma-manager,
      ...
    }@inputs:
    {
      # `nixosConfigurations` is a special output name recognized by `nixos-rebuild`.
      # Using this, you can do `nixos-rebuild switch --flake /path/to/flake/directory#servername`
      # or even `nixos-rebuild switch --flake github:owner/repo#servername` (or git+https://customgitserver.org/owner/repo#server)
      nixosConfigurations.luameow = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux"; # or your target system
        modules = [
          nur.modules.nixos.default
          ./luameow/configuration.nix
          sops-nix.nixosModules.sops
          ({ config, pkgs, ... }: {
            nixpkgs.overlays = [
              (final: prev: {
                # Forces moonlight to fetch the pre-compiled version from the stable cache
                moonlight-qt = inputs.nixpkgs-stable.legacyPackages.${prev.system}.moonlight-qt;
              })
            ];
          })
          home-manager.nixosModules.home-manager
          {
            home-manager.useUserPackages = true;
            home-manager.useGlobalPkgs = true;
            home-manager.backupFileExtension = "backup";
            home-manager.sharedModules = [ plasma-manager.homeModules.plasma-manager ];
            home-manager.users.liv = {
              imports = [
                ./luameow/home-manager/home.nix
              ];
            };
          }
        ];
        # specialArgs is optional, but I like passing all flake inputs here.
        # specialArgs can be referenced in nixos modules at the top of each file, the same way you refer to `pkgs`: `{ pkgs, inputs, ... }:``
        specialArgs = {
          inherit inputs;
        };
      };
    };
}

# Flakes can do a lot more than just this, but these are the basics.
# They are documented here https://wiki.nixos.org/wiki/Flakes (and tbh the wiki probably says most of what i just wrote)
