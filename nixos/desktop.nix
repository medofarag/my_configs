{ config, pkgs, lib, ... }:

{
  imports = [
    # desktop
    # ./desktop/hyprland.nix
    ./desktop/niri.nix
    # ./desktop/sway.nix
    # ./desktop/plasma.nix
    # ./desktop/gnome.nix

    # DisplayManager
    # ./desktop/displayManager/sddm.nix
    # ./desktop/displayManager/gdm.nix
    # ./desktop/displayManager/lightdm.nix
    ./desktop/displayManager/ly.nix
  ];
}
