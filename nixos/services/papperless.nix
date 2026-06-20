{ config, pkgs, ... }:

{
  environment.etc."paperless-admin-pass".text = "admin";
  services.paperless = {
    enable = false;
    passwordFile = "/etc/paperless-admin-pass";
  };
}
