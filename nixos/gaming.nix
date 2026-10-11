{ config, pkgs, lib, ... }:

{
  environment.systemPackages = with pkgs; [    
    wine
    winetricks
    lutris-free
    # flightgear
    # redeclipse
    # megaglest
    # mindustry-wayland
    chess-tui
    stockfish
    # xonotic
    # zeroad
    # neverball
    # luanti
  ];
}
