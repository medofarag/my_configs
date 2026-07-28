{ config, pkgs, lib, ... }:

{
  environment.systemPackages = with pkgs; [    
    wine
    winetricks
    winePackages.stagingFull
    lutris-free
    luanti
    # xonotic
    zeroad
    supertuxkart
    freeciv
    neverball
    nsnake
    nudoku
    kdePackages.kapman
    kdePackages.kbreakout
    kdePackages.kmahjongg
    kdePackages.kpat
    kdePackages.palapeli
    kdePackages.kubrick
  ];
}
