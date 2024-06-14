# hyprland.nix
{ config, pkgs, lib, ... }:

{
    services.hyprland.enable = true;
    services.hyprland.package = pkgs.hyprland; # assuming this package exists
}