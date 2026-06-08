# /etc/nixos/modules/home-manager.nix
{ config, pkgs, lib, inputs,... }:

{
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    
    # user settings from separated file
    # users.medo = import ../home/home.nix;
  };
}
