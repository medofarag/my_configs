# /etc/nixos/home/default.nix
{ config, pkgs, ... }:

{
  imports = [
    ./programs/git.nix
    ./programs/starship.nix
    ./programs/foot.nix
    ./office.nix
    ./packages.nix
  ];

  home.username = "medo";
  home.homeDirectory = "/home/medo";
  home.stateVersion = "26.05";

  programs.home-manager.enable = true;

}
