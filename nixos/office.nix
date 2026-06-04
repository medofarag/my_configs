{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    fsearch
    # sage
    # octave
    # libreoffice
    # onlyoffice-desktopeditors
    proton-vpn
    # tesseract
    # yt-dlp
    obsidian
    planify
    pdfarranger
    localsend
    kdePackages.kolourpaint
    kdePackages.okular
    mousepad
    kdePackages.kasts
  ];
}
