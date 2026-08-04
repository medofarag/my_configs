{ config, pkgs, lib, ... }:

{
  environment.systemPackages = with pkgs; [
    tree-sitter
    luaPackages.tree-sitter-cli
    gcc
    wget
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
  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };
}
