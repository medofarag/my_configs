{ config, pkgs, lib, inputs, ... }:

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
      ascii

      # Local AI
      # koboldcpp # AI
      # ollama-rocm # AI
      # lmstudio

      # yt-dlp
      # kdePackages.filelight
      # element-desktop 
      inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
    ];
  };
  programs.fish.enable = true;
}
