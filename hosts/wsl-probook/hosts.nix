# this flake configures a nixos-wsl host using the file in system/systems/wsl.nix as its base.
# the home manager configuration can be found in users/adrian/home.nix

{
  description = "Nix configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
  };

  outputs = { self, nixpkgs, home-manager }: {
    nixosConfigurations = {
      wsl = import ../../system/systems/wsl.nix {
        inherit nixpkgs;
      };
    };

    homeConfigurations = import ../../users/adrian/home.nix {
      inherit
        nixpkgs 
        nixpkgs-unstable
        home-manager 
        nixos-version
        ;
    };
  };
}
