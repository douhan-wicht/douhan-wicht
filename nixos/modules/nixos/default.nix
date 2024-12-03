{ inputs, outputs, lib, config, pkgs, ... }:

{
  # List your module files here
  imports = [
    ./pulse-secure-vpn.nix
    ./R.nix
    # ./python.nix
    ./vscode.nix
    ./kde.nix
    # ./xfce.nix
    # ./gnome.nix
  ];
}
