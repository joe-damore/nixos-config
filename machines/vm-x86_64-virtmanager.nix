# ARM64 UTM Virtual Machine
{ config, pkgs, modulesPath, ... }: {
  imports = [
    ../hardware/vm-virtmanager.nix
  ];

  networking.hostName = "vm-x86_64-virtmanager";
}
