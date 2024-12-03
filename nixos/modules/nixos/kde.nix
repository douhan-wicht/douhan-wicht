{ pkgs, lib, ... }:

{
  services.xserver = {
    enable = true;
    xkb.layout = "ch";
    xkb.variant = "fr";
    xkb.options = "caps:escape";
  };

  services.displayManager.ly.enable = true;
  services.desktopManager.plasma6.enable = true;

  environment.plasma5.excludePackages = with pkgs.libsForQt5; [
    konsole
    oxygen
    elisa
    libreoffice-still
    kate
    kwallet
    kwallet-pam
    kwalletmanager
  ];

  # Enable sound with pipewire
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };
}
