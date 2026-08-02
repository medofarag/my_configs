{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    sage
    octave
    onlyoffice-desktopeditors
    obsidian
    kdePackages.okular
    mousepad
    ascii-draw
    pdfarranger
    localsend
    pinta
  ];
}
