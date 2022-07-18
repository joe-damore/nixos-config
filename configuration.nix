{ config, pkgs, ... }:

{
  imports = [
    # Include hardware scan result.
    # This file is generated automatically by NixOS; it is not in this repo.
    ./hardware-configuration.nix
  ];

  # Experimental Features.
  #
  # Enables the new Nix command and flakes.
  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';

  # General Settings.
  nixpkgs.config.allowUnfree = true;

  # Advanced System Settings.
  system.stateVersion = "22.05"; # Do not change.

  # Bootloader.
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/vda";
  boot.loader.grub.useOSProber = true;

  # Network.
  networking.networkmanager.enable = true;

  # X11.
  services.xserver.enable = true;
  services.xserver.layout = "us";
  services.xserver.xkbVariant = "";
  services.xserver.libinput.enable = true;

  # Gnome.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # Global Packages.
  #
  # These packages are installed at the system level and are available to all
  # users of the system.
  environment.systemPackages = with pkgs; [
    # Browsers
    firefox
    google-chrome
    microsoft-edge

    # Graphical tools
    firefox
    vscode
    sublime4
    sublime-merge

    # CLI tools
    git
    neovim
    gh

    # Rust
    rustc
    rustup
    cargo

    # Node JS
    nodejs-16_x
    yarn

    # Deno
    deno

    # Gnome Extensions
    gnomeExtensions.pop-shell
    gnomeExtensions.dash-to-dock
  ];

  # Users.
  users.users.joe = {
    description = "Joe D'Amore";
    isNormalUser = true;
    extraGroups = [ "networkmanager" "wheel" ];
  };
}
