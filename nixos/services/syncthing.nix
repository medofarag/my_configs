{ config, pkgs, ... }:

{
  services.syncthing = {
    enable = true;
    openDefaultPorts = true; # Open ports in the firewall for Syncthing. (NOTE: this will not open syncthing gui port)
    user = "medo";
    group = "users";
    configDir = "/home/medo/.config/syncthing";
    dataDir = "/home/medo/.local/share/syncthing";
  };
}
