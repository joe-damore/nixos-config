{
  description = "Joe D's NixOS development environment";

  inputs = {
    # Pin to NixOS 22.05 release.
    # Change this line to upgrade to the next major release (e.g. `release-22.11`).
    nixpkgs.url = "github:nixos/nixpkgs/release-22.05";
  };

  outputs = { self, nixpkgs }: {

    # Configurations:
    #
    # Each configuration represents an individual machine and includes the global
    # configuration file (`configuration.nix`) and the machine-specific configuration
    # file (e.g. `./machines/my-machine.nix`).
    #
    # The machine configuration, in turn, imports any necessary hardware-specific
    # configuration files from `./hardware/`.
    #
    # These configurations can be invoked like so:
    #
    # ```
    # nixos-rebuild switch --flake .#<config-id>
    # ```
    #
    # Where `<config-id>` is the ID of the desired configuration:
    #
    # ```
    # nixos-rebuild switch --flake .#vm-aarch64-utm
    # ```

    # ARM 64-bit VMs (QEMU/UTM).
    nixosConfigurations.vm-aarch64-utm = nixpkgs.lib.nixosSystem {
      system = "aarch64-linux";
      modules = [
        ./configuration.nix
        ./machines/vm-aarch64-utm.nix
      ];
    };

    # x86_64 VMs (QEMU/UTM).
    nixosConfigurations.vm-x86_64-virtmanager = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./configuration.nix
        ./machines/vm-x86_64-virtmanager.nix
      ];
    };
  };
}
