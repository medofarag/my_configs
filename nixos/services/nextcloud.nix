{ config, pkgs, ... }:

{
  environment.etc."nextcloud-admin-pass".text = "PWD";
  services.nextcloud = {
    enable = true;
    package = pkgs.nextcloud35;
    hostName = "localhost";
    config.adminpassFile = "/etc/nextcloud-admin-pass";
    # datadir = "/mnt/data";
    config.dbtype = "sqlite";
    settings = {
      # Some sane defaults required to satisfy Nextcloud configuration check
      maintenance_window_start = 1;
      default_phone_region = "DE";
      log_type = "systemd";
      serverid = 0;
    };

    extraApps = {
      inherit (config.services.nextcloud.package.packages.apps) notes contacts calendar tasks;
      # archive = pkgs.fetchNextcloudApp {
      #   url = "https://github.com/rotdrop/nextcloud-app-files-archive/releases/download/v1.3.0/files_archive-1.3.0.tar.gz";
      #   hash = "sha256-iuEV+1ZNNnmQzK6QNsYGaM3boB6a3ft4aXKCUbQhY8g=";
      #   license = "agpl3Only";
      # };
    };

    extraAppsEnable = true;
  };
  /*
  fileSystems."/var/lib/nextcloud" = {
    device = "/mnt/data";
    fsType = "none";
    options = [ "bind" ];
  };
  */
}
