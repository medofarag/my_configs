{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # sage
    # octave
    # onlyoffice-desktopeditors
    # obsidian
    # kdePackages.okular 
    # drawy
    # stirling-pdf-desktop
    mousepad
    # ascii-draw
    # pdfarranger
    # pinta
  ];
}
