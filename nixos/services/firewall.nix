{ config, pkgs, lib,... }:

{
  networking.firewall = {
    enable = true;
    # Open ports in the firewall.
    allowedTCPPorts = [ 22 80 8384 ]; # ssh http
    # allowedUDPPorts = [ ];
  };
}
