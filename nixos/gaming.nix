{ config, pkgs, lib, ... }:

{
  environment.systemPackages = with pkgs; [    
    wine
    winetricks
    lutris-free
    luanti
    # xonotic
    zeroad
    supertuxkart
    openttd
    neverball
  ];
}
