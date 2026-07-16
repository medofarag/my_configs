{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    sage
    octave
    libreoffice
    kdePackages.okular
    pdfarranger
    tesseract
    obsidian
    localsend
    pinta
  ];
}
