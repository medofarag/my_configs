{ config, pkgs, lib, ... }:

{
  environment.systemPackages = with pkgs; [    
    wine
    winetricks
    lutris-free
    # chess-tui
    # stockfish
    /*
    xonotic
    neverball
    openttd
    luanti
    */
  ];
}
