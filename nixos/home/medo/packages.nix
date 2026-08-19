{ config, pkgs, inputs,... }:

{
  home.packages = with pkgs; [
    libqalculate
    # localsend
    flameshot
    fsearch
    qbittorrent
    keepassxc
    waveterm
    warp-terminal
    oh-my-fish
    mpv
    ascii
    kdePackages.kasts
    proton-vpn
    tor-browser
    yt-dlp
    # kdePackages.filelight
    inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
    inputs.helium.packages.${stdenv.hostPlatform.system}.default
  ];
}
