{ config, pkgs, lib, ... }:

{
  environment.systemPackages = with pkgs; [
    zed-editor
    lua
    python313
    openjdk
    maven
    nodejs
    nasm
    rustup
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
