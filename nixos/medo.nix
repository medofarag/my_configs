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
      notepad-next
      gpu-screen-recorder
      flameshot
      superfile
      fsearch
      keepassxc
      proton-vpn
      qbittorrent
      oh-my-fish
      cmatrix
      asciiquarium
      haruna
      kdePackages.elisa
      ascii
      yt-dlp
      lolcat
      kdePackages.filelight
      inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
    ];
  };
  programs.fish.enable = true;
}
