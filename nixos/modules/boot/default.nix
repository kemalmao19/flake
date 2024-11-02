{ # Bootloader.
  boot.loader.systemd-boot.enable = true;

  boot.loader.efi.canTouchEfiVariables = true;

  boot = {
    kernelModules = [ "applesmc" "i915" ];
    # https://forum.manjaro.org/t/kworker-kacpid-over-70-of-cpu-dual-boot-mac-manjaro/61981
    kernelParams = [ "acpi_mask_gpe=0x17" "i915.force_probe=0166" ];
  };

  # Kernel
  # boot.kernelPackages = pkgs.linuxPackages_6_4;
}
