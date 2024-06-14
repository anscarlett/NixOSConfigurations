{
  description = "Nix complete configuration";

  inputs = let
    nixos-version = "24.05";
  in {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-${nixos-version}";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, nixos-version, ... }: {
    nixosConfigurations = import ./hosts/hosts.nix {
      inherit 
        nixpkgs 
        nixpkgs-unstable
        nixos-version
        ;
    };
  };