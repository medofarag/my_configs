{ config, pkgs,... }:

{
  imports = 
    [
      ./services/fail2ban-and-firewall.nix
    ];
}
