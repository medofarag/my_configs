{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # sage
    # octave
    # onlyoffice-desktopeditors
    obsidian
    kdePackages.okular
    thunderbird-latest-bin
    drawy
    mousepad
    # ascii-draw
    # pdfarranger
    pinta
  ];
}
