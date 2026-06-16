{ config, pkgs,... }:

{
  imports = 
    [
      ./services/fail2ban.nix
      ./services/firewall.nix
      ./services/openssh.nix
      ./services/audio.nix
      ./services/xserver.nix
    ];

  services.vnstat.enable = true;
  services.gnome.gnome-keyring.enable = true;
  services.gvfs.enable = true;
  services.flatpak.enable = true;
  # services.printing.enable = true;
}
