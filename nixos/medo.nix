{ config, pkgs, lib, inputs, ... }:

{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.medo = {
    isNormalUser = true;
    description = "Mahmoud Farag";
    extraGroups = [ "networkmanager" "wheel" "podman"];
    shell = pkgs.fish;
    packages = with pkgs; [];
  };
  programs.fish.enable = true;
}
