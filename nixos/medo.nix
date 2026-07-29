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
      flameshot
      flowblade
      superfile
      fsearch
      qbittorrent
      keepassxc
      proton-vpn
      oh-my-fish
      cmatrix
      asciiquarium
      mpv
      ascii
      tor-browser
      yt-dlp
      webcamoid
      lolcat
      kdePackages.filelight
      inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
    ];
  };
  programs.fish.enable = true;
}
