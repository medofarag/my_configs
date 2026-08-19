{ config, pkgs, lib, fjordlauncher, ... }:

{
  environment.systemPackages = with pkgs; [    
    wine
    winetricks
    lutris-free
    # xonotic
    # neverball
    # openttd
    # luanti
  ];
}
