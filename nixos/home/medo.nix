{ config, pkgs, inputs, ... }:

{
  imports = [
    # ./medo/config/variables.nix
    ./medo/packages.nix  
    ./medo/config/git.nix
    ./medo/config/fish.nix
    # ./medo/config/bash.nix
    # ./medo/config/aliases.nix
    # ./medo/config/neovim.nix
  ];

  home.username = "medo";
  home.homeDirectory = "/home/medo";
  home.stateVersion = "26.05";

  programs.bash = {
    enable = true;
    bashrcExtra = ''
      # Aliases
      alias ll='ls -la'

      # PATH
      export PATH="$HOME/.local/bin:$PATH"
    '';
  };


  home.sessionVariables = {
    EDITOR = "nvim";
    BROWSER = "helium";
  };
}
