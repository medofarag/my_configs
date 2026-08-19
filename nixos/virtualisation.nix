{ config, pkgs, lib, ... }:

{
  virtualisation.podman = {
    enable = true;
    dockerCompat = true;
  };

  environment.systemPackages = with pkgs; [
    distrobox
    # guestfs-tools
    # virtiofsd
    # virtio-win
  ];

  /*
  # virtmanager
  programs.virt-manager.enable = true;
  users.groups.libvirtd.members = ["medo"];
  virtualisation.libvirtd.enable = true;
  virtualisation.spiceUSBRedirection.enable = true;
  virtualisation.libvirtd.qemu = {
    swtpm.enable = true;
  };
  */

  /*
  # virtualbox
  virtualisation.virtualbox.host.enable = true;
  users.extraGroups.vboxusers.members = [ "medo" ];
  virtualisation.virtualbox.guest.enable = false;
  virtualisation.virtualbox.guest.dragAndDrop = true;
  boot.kernelModules = [ "vboxdrv" "vboxnetadp" "vboxnetflt" ];
  */
}
