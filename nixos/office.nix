{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    sage
    octave
    libreoffice
    onlyoffice-desktopeditors
    kdePackages.okular
    pdfarranger
    tesseract
    obsidian
    localsend
    pinta
    kdePackages.kasts
  ];
}
