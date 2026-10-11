{ config, pkgs, lib, inputs, ... }:

{
  imports = [
    ./shells/noctalia.nix
  ];

  programs.niri = {
    enable = true;
  };

  environment.systemPackages = with pkgs; [
    flameshot
    foot
    wl-clipboard
    loupe

    xwayland-satellite

    # theme
    kdePackages.breeze
    kdePackages.breeze-gtk
    kdePackages.breeze-icons
    adwaita-icon-theme
    adwaita-fonts
    adw-gtk3
    papirus-icon-theme
    papirus-folders
    qt6Packages.qt6ct
    libsForQt5.qt5ct
    nwg-look

    # Essential apps
    nautilus
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
