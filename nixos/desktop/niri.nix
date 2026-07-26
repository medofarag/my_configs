{ config, pkgs, lib, inputs, ... }:

{
  imports = [
    ./shells/dms.nix
  ];

  programs.niri = {
    enable = true;
  };

  environment.systemPackages = with pkgs; [
    flameshot
    foot
    hyprpolkitagent
    wl-clipboard
    loupe
    
    xwayland-satellite

    # theme
    kdePackages.breeze
    kdePackages.breeze-gtk
    kdePackages.breeze-icons
    qt6Packages.qt6ct
    kdePackages.qt6ct
    libsForQt5.qt5ct
    nwg-look

    # Essential apps
    pcmanfm
    xarchiver
    ffmpegthumbnailer
    libappimage
  ];

  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
    extraPortals = [pkgs.xdg-desktop-portal-gtk];
    configPackages = [pkgs.xdg-desktop-portal-gtk];
    config.common.default = "gtk";
  };
}
