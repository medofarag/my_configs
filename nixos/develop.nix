{ config, pkgs, lib, ... }:

{
  environment.systemPackages = with pkgs; [
    lua
    python313
    python313Packages.pip
    ollama
    python313Packages.ollama
    # openjdk
    # maven
    # nodejs
    helix
    sqlite
    rustc
    cargo
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
