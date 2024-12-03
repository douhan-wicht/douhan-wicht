{ pkgs, lib, ... }:

{
  services.xserver = {
    enable = true;
    xkb.layout = "ch";
    xkb.variant = "fr";
    xkb.options = "caps:escape";
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
  };

  # Exclude packages
  environment.gnome.excludePackages = with pkgs; [
    gnome-tour
    gnome-connections
    epiphany # web browser
    gnome.geary # email reader. Up to 24.05. Starting from 24.11 the package name is just geary.
    evince # document viewer
  ];

  # Additinal packages and extensions
  environment.systemPackages = with pkgs; [
    gnome.adwaita-icon-theme
    gnomeExtensions.blur-my-shell
    gnomeExtensions.pop-shell
    gnomeExtensions.appindicator
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

  # Ensure gnome-settings-daemon udev rules are enabled
  services.udev.packages = [ pkgs.gnomegnome-settings-daemon ];
}
