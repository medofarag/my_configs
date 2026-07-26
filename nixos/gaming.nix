{ config, pkgs, lib, ... }:

{
  environment.systemPackages = with pkgs; [    
    wine
    winetricks
    winePackages.stagingFull
    lutris-free
    luanti
    # xonotic
    # zeroad
    supertuxkart
    freeciv
    neverball
  ];
}
