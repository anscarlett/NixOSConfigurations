
{ config, pkgs, lib, ... }:

{
    boot.kernelModules = [ "decklink" ];
    hardware.blackmagic.enable = true;
    hardware.blackmagic.package = pkgs.blackmagic-desktop-video;
}