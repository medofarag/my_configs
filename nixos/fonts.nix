{ config, pkgs, lib, ... }:

{
  fonts = {
    fontconfig = {
      enable = true;
      defaultFonts = {
        monospace = [ "JetBrains Mono" "DejaVu Sans Mono" ];
        sansSerif = [ "Noto Sans" "DejaVu Sans" ];
        serif = [ "Noto Serif" "DejaVu Serif" ];
      };
    };
    packages = with pkgs; [
      font-awesome
      noto-fonts-color-emoji
      nerd-fonts.symbols-only
      # noto-fonts-cjk-sans
      nerd-fonts.dejavu-sans-mono
      vista-fonts
      corefonts
      unicode-emoji
      liberation_ttf
      noto-fonts
      dejavu_fonts
      jetbrains-mono
    ];
  };
}
