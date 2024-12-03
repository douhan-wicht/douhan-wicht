{ config, pkgs, lib, inputs, outputs, ... }:

{
  imports = [
    inputs.home-manager.nixosModules.default
    ../../modules/nixos/default.nix
    ./hardware-configuration.nix
  ];

  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Hostname
  networking.hostName = "mako";

  # Enable printing
  services.printing.enable = true;

  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };

  services.printing.drivers = [
    pkgs.hplip
  ];

  # Enable flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Networking
  networking = {
    networkmanager = {
      enable = true;
      unmanaged = [ "interface-name:ve-*" ];
    };
    nat = {
      enable = true;
      internalInterfaces = [ "ve-+" ];
      externalInterface = "wlp0s20f3";
    };
    firewall.allowedTCPPorts = [];
  };

  # Set your time zone
  time.timeZone = "Europe/Zurich";

  # Select internationalisation properties
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "fr_CH.UTF-8";
    LC_IDENTIFICATION = "fr_CH.UTF-8";
    LC_MEASUREMENT = "fr_CH.UTF-8";
    LC_MONETARY = "fr_CH.UTF-8";
    LC_NAME = "fr_CH.UTF-8";
    LC_NUMERIC = "fr_CH.UTF-8";
    LC_PAPER = "fr_CH.UTF-8";
    LC_TELEPHONE = "fr_CH.UTF-8";
    LC_TIME = "fr_CH.UTF-8";
  };

  # Define a user account
  users.users.douhan = {
    isNormalUser = true;
    description = "Douhan Wicht";
    extraGroups = [ "networkmanager" "wheel" "libvirtd" "adbusers" "kvm" ];
    packages = with pkgs; [
      # Add user-specific packages here
    ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in the system profile
  environment.systemPackages = with pkgs; [
    # System utilities
    git
    github-desktop
    bluez
    blueberry
    neovim
    htop
    pipes
    guvcview
    nextcloud-client
    vlc
    pandoc
    texliveFull
    kdePackages.isoimagewriter
    krename
    libsForQt5.full
    go-sct
    libsForQt5.kompare
    wl-color-picker

    # Productivity tools
    onlyoffice-bin
    firefox
    beeper
    slack
    joplin-desktop
    qownnotes
    obsidian
    xournalpp
    klavaro
    anki
    mendeley
    jabref
    kbibtex
    pdfarranger

    # Media and entertainment
    krita
    gimp
    inkscape
    spotify
    discord
    kdePackages.ktorrent
    kdePackages.kgeography
    gnome-mines
    mgba

    # VPN and security
    protonvpn-gui

    # 3D printing
    prusa-slicer

    # Virtualization
    bottles
    quickemu
    spice
    spice-gtk
    spice-protocol
    virtio-win
    win-spice
    distrobox
    boxbuddy

    # Bioinformatics tools
    messer-slim
    fiji
  ];

  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-emoji
    liberation_ttf
    fira-code
    fira-code-symbols
    mplus-outline-fonts.githubRelease
    dina-font
    proggyfonts
    iosevka
    corefonts
    vistafonts
  ];


  # Bash config
  programs.bash = {
    enableLsColors = true;
  };

  programs.bash.completion = {
    enable = true;
  };

  # Environment variables
  environment.variables = {
    EDITOR = "nvim";
  };

  # Virtualisation
  programs.virt-manager.enable = true;

  virtualisation = {
    libvirtd = {
      enable = true;
      qemu = {
        package = pkgs.qemu_kvm;
        swtpm.enable = true;
        ovmf.enable = true;
        ovmf.packages = [ pkgs.OVMFFull.fd ];
      };
    };
    spiceUSBRedirection.enable = true;
  };

  # Evolution mail and calendar
  programs.evolution = {
    enable = true;
    plugins = [ pkgs.evolution-ews ];
  };

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Enable bluetooth
  hardware.bluetooth.enable = true;
  security.polkit.enable = true;

  # NixOS release version
  system.stateVersion = "23.11";
}
