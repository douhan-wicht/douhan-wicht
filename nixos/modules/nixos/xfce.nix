{ config, pkgs, callPackage, ... }:

{
  environment = {
    systemPackages = with pkgs; [
      blueman                    # Bluetooth manager
      font-manager               # Font management tool
      file-roller                # Archive manager
      gnome-disk-utility         # Disk management utility
      pavucontrol                # PulseAudio volume control
      wmctrl                     # Command-line tool to interact with an X Window Manager
      xclip                      # Command-line interface to the X clipboard
      xcolor                     # Color picker for X
      xcolor                     # Color picker for X (duplicate entry)
      xdo                        # Small X utility to perform actions on windows
      xdotool                    # Command-line X11 automation tool
      xfce.catfish               # File search utility for XFCE
      xfce.gigolo                # Network filesystems manager for XFCE
      xfce.orage                 # Calendar application for XFCE
      xfce.xfburn                # CD/DVD burning tool for XFCE
      xfce.xfce4-appfinder       # Application finder for XFCE
      xfce.xfce4-clipman-plugin  # Clipboard manager plugin for XFCE
      xfce.xfce4-cpugraph-plugin # CPU graph plugin for XFCE
      xfce.xfce4-dict            # Dictionary plugin for XFCE
      xfce.xfce4-fsguard-plugin  # Filesystem guard plugin for XFCE
      xfce.xfce4-genmon-plugin   # Generic monitor plugin for XFCE
      xfce.xfce4-netload-plugin  # Network load monitor plugin for XFCE
      xfce.xfce4-panel           # Panel for XFCE
      xfce.xfce4-pulseaudio-plugin # PulseAudio plugin for XFCE
      xfce.xfce4-systemload-plugin # System load monitor plugin for XFCE
      xfce.xfdashboard           # Dashboard for XFCE
      xorg.xev                   # X event viewer
      xsel                       # Command-line tool to access X clipboard
      xtitle                     # Set window titles in X
    ];
  };

  hardware = {
    bluetooth.enable = true;
  };

  programs = {
    dconf.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
    thunar = {
      enable = true;
      plugins = with pkgs.xfce; [
        thunar-archive-plugin
        thunar-media-tags-plugin
        thunar-volman
      ];
    };
  };

  security.pam.services.gdm.enableGnomeKeyring = true;

  services = {
    blueman.enable = true;
    gnome.gnome-keyring.enable = true;
    pipewire = {
      enable = true;
      alsa = {
        enable = true;
        support32Bit = true;
      };
      pulse.enable = true;
    };
    
    xserver = {
      enable = true;
      xkb.layout = "ch";
      xkb.variant = "fr";
      xkb.options = "caps:escape";
      excludePackages = with pkgs; [
        xterm
      ];
      displayManager = {
        lightdm.enable = true;
      };
      desktopManager.xfce.enable = true;
    };
  };
}