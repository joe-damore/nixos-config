# ARM64 UTM Virtual Machine
{ config, pkgs, modulesPath, ... }: {
  imports = [
    ../hardware/vm-utm.nix
  ];

  networking.hostName = "vm-aarch64-utm";
  nixpkgs.config.allowUnsupportedSystem = true;
}
