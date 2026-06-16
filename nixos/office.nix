{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # sage
    octave
    libreoffice
    onlyoffice-desktopeditors
    kdePackages.okular
    pdfarranger
    # tesseract
    obsidian
    # zotero
    localsend
    pinta
    mousepad
    kdePackages.kasts
  ];
}
