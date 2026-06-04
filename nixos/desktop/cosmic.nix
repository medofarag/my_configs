{ config, pkgs, ... }:

{
  services.desktopManager.cosmic.enable = true;
  environment.cosmic.excludePackages = with pkgs; [
    # cosmic-edit
  ];
  services.system76-scheduler.enable = true;
  environment.sessionVariables.COSMIC_DATA_CONTROL_ENABLED = 1;
}
