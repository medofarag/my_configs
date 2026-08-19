{ config, pkgs, ... }:

{
  # Enable Plasma 
  services = {
    desktopManager.plasma6.enable = true;

    # Default display manager for Plasma
    displayManager.plasma-login-manager.enable = false;
    displayManager.sddm.enable = true;

    # Optionally enable xserver
    # xserver.enable = true;
  };

  environment.plasma6.excludePackages = with pkgs.kdePackages; [];
}
