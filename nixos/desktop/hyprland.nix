{ config, pkgs, lib, inputs,... }:

{
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  environment.systemPackages = with pkgs; [
    hyprpanel
    hyprpolkitagent
    fuzzel
    bemoji
    hyprlock
    hypridle
    awww
    foot
    hyprnotify
    hyprpicker
    gpick
    hyprland-qtutils
    hyprshot
    wl-clipboard
    loupe

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
