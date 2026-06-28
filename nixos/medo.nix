{ config, pkgs, lib, inputs, ... }:

{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.medo = {
    isNormalUser = true;
    description = "Mahmoud Farag";
    extraGroups = [ "networkmanager" "wheel" "libvirtd" "podman"];
    shell = pkgs.fish;
    packages = with pkgs; [
      libqalculate
      fsearch
      qbittorrent
      oh-my-fish
      cmatrix
      asciiquarium
      vlc
      ascii
      yt-dlp
      lolcat
      kdePackages.filelight
      element-desktop
      gajim
      telegram-desktop
      inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
    ];
  };
  programs.fish.enable = true;
}
