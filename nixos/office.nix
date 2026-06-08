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
    planify
    pdfarranger
    openboard
    # paperless-ngx # document manager
    # super-productivity
    # appflowy # notion alternative
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
