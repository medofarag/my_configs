{ config, pkgs, lib, ... }:

{
  environment.systemPackages = with pkgs; [    
    wine
    winetricks
    winePackages.stagingFull
    luanti
    # xonotic
    # zeroad
    # supertuxkart
    freeciv
    neverball
  ];
}
