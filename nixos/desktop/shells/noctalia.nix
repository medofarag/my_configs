{ config, inputs, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
    gpu-screen-recorder
    translate-shell

    # required by screen toolkits
    grim
    slurp
    wl-clipboard
    tesseract
    imagemagick
    zbar
    curl
    ffmpeg
    jq
    wl-screenrec
    python3
    xdg-desktop-portal
    hyprpicker
    gifski
    zenity
  ];
}
