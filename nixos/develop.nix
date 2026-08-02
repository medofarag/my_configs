{ config, pkgs, lib, ... }:

{
  environment.systemPackages = with pkgs; [
    zed-editor
    wget
    lua
    luaPackages.tree-sitter-cli
    gcc
    gnumake
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
