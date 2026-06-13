{ config, pkgs, lib, ... }:

{
  imports = [
    # desktop
    # ./desktop/hyprland.nix
    ./desktop/niri.nix
    # ./desktop/sway.nix

    # DisplayManager
    # ./desktop/displayManager/lightdm.nix
    ./desktop/displayManager/ly.nix
  ];
}
