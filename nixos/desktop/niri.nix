{ config, pkgs, lib, inputs, ... }:

{
  imports = 
    [
      ./shells/dank.nix
    ];

  programs.niri = {
    enable = true;
  };

  environment.systemPackages = with pkgs; [
    flameshot
    hyprpolkitagent
    foot
    gpick
    wl-clipboard
    loupe

    xwayland-satellite

    # theme
    kdePackages.breeze
    kdePackages.breeze-gtk
    kdePackages.breeze-icons
    qt6Packages.qt6ct
    libsForQt5.qt5ct
    nwg-look

    # Essential apps
    pcmanfm
    xarchiver
    ffmpegthumbnailer

    gpu-screen-recorder # needed by noctlia by plugin for screen recording 
  ];

  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
    extraPortals = [pkgs.xdg-desktop-portal-gtk];
    configPackages = [pkgs.xdg-desktop-portal-gtk];
    config.common.default = "gtk";
  };
}
