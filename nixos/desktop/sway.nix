{ config, pkgs, lib, ... }:

{
  programs.sway = {
    enable = true;
    extraPackages = with pkgs; [
      swayidle
      swaylock
      waybar
      eww
      mailcap
      foot
      fuzzel
      bemoji
      wl-clipboard
      autotiling
      fnott
      pcmanfm
      xarchiver
      gsimplecal
      gnome-clocks
      grim
      flameshot
      gpick
      ffmpegthumbnailer
      libappimage
      loupe
      polkit_gnome

      # Themes
      kdePackages.breeze
      kdePackages.breeze-gtk
      kdePackages.breeze-icons
      kdePackages.breeze-grub
      qt6Packages.qt6ct
      libsForQt5.qt5ct
      nwg-look
      adwaita-qt
      adwaita-icon-theme
      libadwaita
    ];
  };
}
