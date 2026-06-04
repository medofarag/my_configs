{ config, pkgs, lib, ... }:

{
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    theme = "";
    enableHidpi = true;
    settings = {
      /*
      Autologin = {
        Session = "plasma.desktop";
        User = "john";
      };
      */
    };
  };
}
