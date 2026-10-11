{ config, pkgs, ... }:

{
  # Enable the FreshRSS service
  services.freshrss = {
    enable = true;
    virtualHost = "freshrss.local"; # Put any name here, it doesn't need to resolve
    baseUrl = "http://localhost:8585"; # Change 8080 to your desired port
    webserver = "nginx";
    defaultUser = "admin";
    passwordFile = "/etc/freshrss-admin-pass";
  };

  # Database setup (PostgreSQL)
  services.postgresql = {
    enable = true;
    ensureDatabases = [ "freshrss" ];
    ensureUsers = [
      {
        name = "freshrss";
        ensureDBOwnership = true;
      }
    ];
  };

  # Nginx configuration for a specific port (no TLS)
  services.nginx.virtualHosts."freshrss.local" = {
    listen = [
      {
        addr = "0.0.0.0"; # Listen on all interfaces
        port = 8585;       # Change this to your desired port
      }
    ];
    # Disable SSL/ACME since you don't have a domain
    forceSSL = false;
    enableACME = false;
  };

  # Important: Allow the port through the firewall
  networking.firewall.allowedTCPPorts = [ 8585 ]; # Add your port here
  environment.etc."freshrss-admin-pass".text = "PWD";
}

/* do not forget to set password
  # Create the file and set permissions
  sudo echo "your-strong-password" | sudo tee /etc/secrets/freshrss
  sudo chown freshrss:freshrss /etc/secrets/freshrss
  sudo chmod 400 /etc/secrets/freshrss
*/
