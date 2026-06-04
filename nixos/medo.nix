{ config, pkgs, lib, ... }:

{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.medo = {
    isNormalUser = true;
    description = "Mahmoud Farag";
    extraGroups = [ "networkmanager" "wheel" "libvirtd" "podman"];
    shell = pkgs.fish;
    packages = with pkgs; [
      oh-my-fish
      cmatrix
      asciiquarium
      haruna
      kdePackages.elisa
    ];
  };
  programs.fish.enable = true;
}
