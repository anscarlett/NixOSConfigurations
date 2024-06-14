{
    description = "Home Manager configuration";

    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
        home-manager.url = "github:nix-community/home-manager";
    };

    outputs = { self, nixpkgs, home-manager }: {
        homeConfigurations = let
            username = "adrian";
        in {
            myConfig = home-manager.lib.homeManagerConfiguration {
                configuration = { pkgs, ... }: {
                    home.packages = with pkgs; [
                        htop
                        neovim
                    ];
                };
                homeDirectory = "/home/${username}";
                username = username;
            };
        };
    };
}