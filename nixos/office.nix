{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    fsearch
    # sage
    # octave
    # libreoffice
    onlyoffice-desktopeditors
    proton-vpn
    # tesseract
    obsidian
    # super-productivity
    pdfarranger
    # paperless-ngx # document manager
    # zotero
    localsend
    pinta
    kdePackages.okular
    mousepad
    kdePackages.kasts
  ];
}
