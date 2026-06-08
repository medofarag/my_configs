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
    # yt-dlp
    obsidian
    # super-productivity
    planify
    pdfarranger
    openboard
    # paperless-ngx # document manager
    # zotero
    # drawio
    localsend
    kdePackages.kolourpaint
    # pinta
    kdePackages.okular
    mousepad
    kdePackages.kasts
  ];
}
