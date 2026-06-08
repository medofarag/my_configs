{ config, pkgs, lib, ... }:

{
  users.users.medo = {
    packages = with pkgs; [
      luanti
      # supertux
      # supertuxkart
      # xonotic
      # beyond-all-reason
      # 0ad
      # redeclipse
      sauerbraten
      # frogatto
      # gzdoom
      extremetuxracer
      neverball
      # bugdom
    ];
  };

  environment.systemPackages = with pkgs; [    
    # wine
    wine
    winetricks
  ];

  programs.steam = {
    enable = true;
    # remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    # dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    # localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
  };
}
