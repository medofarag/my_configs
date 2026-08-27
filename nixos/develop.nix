{ config, pkgs, lib, ... }:

{
  environment.systemPackages = with pkgs; [
    tree-sitter
    luaPackages.tree-sitter-cli
    gcc
    wget
    lua
    python313
    # openjdk
    # maven
    nodejs
    # nasm
    rustup
    # sqlite
    tokei
    bat
    eza
    ripgrep
    fd
    fzf
    git
    # jq
    tmux

    bruno
    mongosh
    # jetbrains.webstorm
  ];

  services.mongodb = { 
    enable = true;
    package = pkgs.mongodb-ce;
  };

  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };
}
