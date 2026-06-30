{ config, pkgs, lib,... }:

{
  networking.firewall = {
    enable = true;
    # Open ports in the firewall.
    allowedTCPPorts = [ 80 ]; # http
    # allowedUDPPorts = [ ];
  };
}
