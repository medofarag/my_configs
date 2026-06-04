{ config, pkgs, lib, ... }:

{
  imports = [
    # desktop
    ./desktop/hyprland.nix
    # ./desktop/sway.nix
    # ./desktop/plasma.nix
    # ./desktop/gnome.nix
    # ./desktop/cinnamon.nix
    # ./desktop/cosmic.nix

    # DisplayManager
    # ./desktop/displayManager/sddm.nix
    # ./desktop/displayManager/gdm.nix
    # ./desktop/displayManager/lightdm.nix
    ./desktop/displayManager/ly.nix
    # ./desktop/displayManager/cosmic.nix
  ];
}
