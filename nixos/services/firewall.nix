{ config, pkgs, lib,... }:

{
  networking.firewall = {
    enable = true;
    # Open ports in the firewall.
    allowedTCPPorts = [ 80 443 22 ]; # http tor ssh
    # allowedUDPPorts = [ ]; # ssh
  };
}
