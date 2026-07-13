{ config, pkgs, lib, ... }:

{
  imports = [
    # desktop
    ./desktop/niri.nix

    # DisplayManager
    # ./desktop/displayManager/lightdm.nix
    ./desktop/displayManager/ly.nix
  ];
}
