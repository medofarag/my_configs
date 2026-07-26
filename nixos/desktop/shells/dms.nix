{ config, pkgs, ... }:

{
  programs.dms-shell = {
    enable = true;

    systemd = {
      enable = true;             # Systemd service for auto-start
      restartIfChanged = true;   # Auto-restart dms.service when dms-shell changes
    };
  };

  environment.systemPackages = with pkgs; [
    wf-recorder
    translate-shell
    gpu-screen-recorder
    zenity
    uv
    tesseract
    imagemagick
    img2pdf
    zbar
    qt6.qtdeclarative
    qt6.qt5compat
  ];
}
