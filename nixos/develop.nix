{ config, pkgs, lib, ... }:

{
  environment.systemPackages = with pkgs; [
    lua
    python313
    openjdk
    maven
    nodejs
    nasm
    sqlite
    bat
    eza
    ripgrep
    fd
    fzf
    git
    jq
    tmux
  ];
}
