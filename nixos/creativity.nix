{ config, pkgs, inputs, ... }:

{
  environment.systemPackages = with pkgs; [
    # kdePackages.kdenlive
    # obs-studio
    # kdePackages.krita
    # inkscape
    # synfigstudio
    # gimp
    # blender
  ];
}
