{ config, pkgs, lib, inputs,... }:

{
  programs.niri = {
    enable = true;
    # xwayland.enable = true;
  };

  environment.systemPackages = with pkgs; [
    hyprpolkitagent
    fuzzel
    bemoji
    walker
    elephant
    hyprlock
    flameshot
    hypridle
    awww
    foot
    hyprnotify
    gpick
    wl-clipboard
    loupe

    xwayland
    xwayland-satellite
    xwayland-run

    # theme
    kdePackages.breeze
    kdePackages.breeze-gtk
    kdePackages.breeze-icons
    qt6Packages.qt6ct
    libsForQt5.qt5ct
    nwg-look

    adwaita-qt
    adwaita-icon-theme
    libadwaita

    # Essential apps
    pcmanfm
    xarchiver
    gnome-clocks
    ffmpegthumbnailer

    inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
}
