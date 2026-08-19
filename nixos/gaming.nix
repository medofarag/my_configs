{ config, pkgs, lib, ... }:

{
  environment.systemPackages = with pkgs; [    
    wine
    winetricks
    lutris-free
    # fjordlauncher.packages.${pkgs.system}.fjordlauncher
    # xonotic
    # neverball
    # openttd
    # luanti
  ];
}
