{ config, pkgs, lib, inputs, ... }:

{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.medo = {
    isNormalUser = true;
    description = "Mahmoud Farag";
    extraGroups = [ "networkmanager" "wheel" "podman"];
    shell = pkgs.fish;
    packages = with pkgs; [
      libqalculate
      localsend
      flameshot
      fsearch
      qbittorrent
      keepassxc
      oh-my-fish
      mpv
      ascii
      kdePackages.kasts
      proton-vpn
      tor-browser
      age
      yt-dlp
      kdePackages.filelight
      inputs.helium.packages.${stdenv.hostPlatform.system}.default
    ];
  };
  programs.fish.enable = true;
  programs.firefox.enable = true;
}
