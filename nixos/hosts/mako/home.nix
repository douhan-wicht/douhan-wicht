{ config, pkgs, ... }:

{
  # Home Manager configurations for user 'douhan'

  # Backup conflicting files automatically
  home-manager.backupFileExtension = "backup";

  # Home directory configurations
  home = {
    username = "douhan";
    homeDirectory = "/home/douhan";
    stateVersion = "23.11";
    sessionVariables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
    };
  };

  # Dconf settings for Virt-manager
  dconf.settings = {
    "org/virt-manager/virt-manager/connections" = {
      autoconnect = [ "qemu:///system" ];
      uris = [ "qemu:///system" ];
    };
  };

  # Other Home Manager-specific settings can go here
  # E.g. programs, dotfiles, etc.
}
