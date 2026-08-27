{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # sage
    # octave
    # onlyoffice-desktopeditors
    obsidian
    kdePackages.okular
    drawy
    mousepad
    # ascii-draw
    # pdfarranger
    pinta
  ];
}
