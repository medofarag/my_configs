{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    sage
    octave
    libreoffice
    obsidian
    emacs
    kdePackages.okular
    kdePackages.kasts
    mousepad
    ascii-draw
    pdfarranger
    tesseract
    localsend
    pinta
  ];
}
