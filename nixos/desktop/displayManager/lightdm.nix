{ config, pkgs, ... }:

{
  services.displayManager.lightdm = {
    enable = true;  
  };
}
