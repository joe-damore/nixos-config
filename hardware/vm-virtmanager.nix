# QEMU/Virt Manager virtual hardware.
{ config, pkgs, modulesPath, ... }: {
  services.spice-vdagentd.enable = true;
}
