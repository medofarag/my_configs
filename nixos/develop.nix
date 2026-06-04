{ config, pkgs, lib, ... }:

{
  environment.systemPackages = with pkgs; [
    lua 
    # openjdk
    # maven
    # nodejs
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
