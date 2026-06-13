{ config, pkgs,... }:

{
  imports = 
    [
      ./services/fail2ban.nix
      ./services/firewall.nix
    ];
}
