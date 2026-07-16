# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, lib, inputs,... }:

{
  imports =
    [ 
      # Include the results of the hardware scan.
      ./hardware-configuration.nix

      # Systemd services
      ./services.nix

      # virtualisation
      ./virtualisation.nix

      # Desktop
      ./desktop.nix

      # Fonts
      ./fonts.nix

      # medo user settings
      ./medo.nix

      # developing
      ./develop.nix

      # gaming
      ./gaming.nix

      # office
      ./office.nix
    ];

  # Bootloader.
  boot.loader = {
    systemd-boot = {
      enable = false;
    }; 

    grub = {
      enable = true;
      efiSupport = true;
      device = "nodev";
      # theme = pkgs.kdePackages.breeze-grub;
    };
  
    efi = {
      canTouchEfiVariables = true;
    };
  };

  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_zen;
  
  networking.hostName = "medo"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking.
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Africa/Cairo";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "ar_EG.UTF-8";
    LC_IDENTIFICATION = "ar_EG.UTF-8";
    LC_MEASUREMENT = "ar_EG.UTF-8";
    LC_MONETARY = "ar_EG.UTF-8";
    LC_NAME = "ar_EG.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "ar_EG.UTF-8";
    LC_TELEPHONE = "ar_EG.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  environment = {
    sessionVariables = {
      QT_QPA_PLATFORMTHEME = "qt6ct";
    };
  };

  nix.settings.require-sigs = true;
  boot.kernel.sysctl."kernel.kptr_restart" = 1;

  security.polkit.enable = true;
  security.sudo.enable = false;
  security.doas.enable = true;
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  nixpkgs.config.permittedInsecurePackages = [
    "luanti-5.14.0"
    "electron-39.8.10"
  ];

  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "mongodb"
    "obsidian"
    "vista-fonts"
    "corefonts"
  ];

  programs.appimage.enable = true;
  programs.appimage.binfmt = true;
  programs.appimage.package = pkgs.appimage-run.override { 
    extraPkgs = pkgs: [
      pkgs.python312
    ]; 
  };

  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    stdenv.cc.cc.lib
    libX11
    libXcursor
    libXi
    libXrandr
    libGL
    libxml2
    gtk3
    harfbuzzFull
  ];

  # List packages installed in system profile. To search, run:
  # $ nix search wget

  programs.neovim.enable = true;
  programs.neovim.defaultEditor = true;
  
  environment.systemPackages = with pkgs; [

    doas-sudo-shim

    # media control
    playerctl

    # cli tools
    btop
    fastfetch
    vnstat
    nethogs
    tree-sitter
    zoxide

    ffmpeg
    unrar-free
    zip
    unzip

    # Disk
    gparted
    btrfs-progs
    ntfs3g
    exfatprogs
    dosfstools
    xfsprogs

    nix-search
    wl-clipboard
  ];

  # Enable flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:


  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?
}
