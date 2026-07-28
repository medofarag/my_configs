{ config, pkgs, lib, ... }:

{
  environment.systemPackages = with pkgs; [
    kdePackages.konsole
    wget
    lua
    luaPackages.tree-sitter-cli
    gcc
    tree-sitter
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
