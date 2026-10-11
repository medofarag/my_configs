{ config, inputs, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    noctalia
    gpu-screen-recorder
    
    # required by screen toolkits
    grim
    slurp
    wl-clipboard
    tesseract
    translate-shell
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

    # bazaar
  ];
}
