{ config, pkgs, lib, ... }:

{
  environment.systemPackages = with pkgs; [
    lua 
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
