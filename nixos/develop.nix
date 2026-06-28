{ config, pkgs, lib, ... }:

{
  environment.systemPackages = with pkgs; [
    lua
    python313
    python313Packages.ollama
    openjdk
    maven
    nodejs
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

  services.ollama = {
    enable = true;
    # Optional: preload models, see https://ollama.com/library
    # loadModels = [ "llama3.2:3b" "deepseek-r1:1.5b"];
  };
}
