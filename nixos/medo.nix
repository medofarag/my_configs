{ config, pkgs, lib, inputs, ... }:

{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.medo = {
    isNormalUser = true;
    description = "Mahmoud Farag";
    extraGroups = [ "networkmanager" "wheel" "podman" "nextcloud" ];
    shell = pkgs.fish;
    packages = with pkgs; [
      libqalculate
      localsend
      flameshot
      fsearch
      transmission_4-gtk
      gnome-multi-writer 
      pass
      python314Packages.faker
      oh-my-fish
      mpv
      aria2
      ascii
      tor-browser
      onionshare-gui
      yt-dlp
      kdePackages.filelight
      inputs.helium.packages.${pkgs.stdenv.hostPlatform.system}.default
    ];
  };
  programs.firefox.enable = true;
  programs.fish.enable = true;
}
