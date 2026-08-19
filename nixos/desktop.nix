{ config, pkgs, lib, ... }:

{
  imports = [
    # desktop
    ./desktop/niri.nix
    # ./desktop/plasma.nix

    # DisplayManager
    ./desktop/displayManager/ly.nix
  ];
}
