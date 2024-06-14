{
    description = "A NixOS flake for WSL";

    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
        nixos-wsl.url = "github:nix-community/nixos-wsl";
    };

    outputs = { self, nixpkgs, nixos-wsl }: {
        nixosConfigurations.myConfig = nixpkgs.lib.nixosSystem {
            system = "x86_64-linux";
            modules = [
                ({...}: {
                    imports = [
                        nixos-wsl.overlay
                        ../../default-packages.nix
                    ];
                })
            ];
        };
    };
}