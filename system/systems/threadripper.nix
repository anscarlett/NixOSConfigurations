{
    description = "A NixOS flake for x86-64-linux PC";

    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    };

    outputs = { self, nixpkgs }: {
        nixosConfigurations.myConfig = nixpkgs.lib.nixosSystem {
            system = "x86_64-linux";
            modules = [
                ({...}: {
                    imports = [
                        ../../defaultPackages.nix
                        ../video-capture/decklink.nix
                    ];
                })
            ];
        };
    };
}