# QEMU/UTM virtual hardware.
{ config, pkgs, modulesPath, ... }: {
  services.spice-vdagentd.enable = true;
  # For now, we need this since hardware acceleration does not work.
  environment.variables.LIBGL_ALWAYS_SOFTWARE = "1";
}
