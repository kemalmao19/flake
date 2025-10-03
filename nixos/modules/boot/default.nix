{ config, pkgs, ... }: { 
  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.systemd-boot.configurationLimit = 5;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot";

  boot = {
    kernelModules = [ "applesmc" "i915" "wl" "kvm-intel" ];
    # https://forum.manjaro.org/t/kworker-kacpid-over-70-of-cpu-dual-boot-mac-manjaro/61981
    kernelParams = [
      # Power saving Intel GPU (i915)
      "i915.force_probe=0166"
      "i915.enable_psr=1"
      "i915.enable_dc=2"
      "i915.enable_fbc=1"

      # "acpi_backlight=vendor"
      "pci=nomsi"

      # Enable IOMMU (untuk GPU passthrough / DMA protection)
      "intel_iommu=on"

      # System Responsiveness
      "sched_autogroup_enabled=1"
      "nowatchdog"
    ];
  };

  boot.extraModulePackages = [ config.boot.kernelPackages.broadcom_sta ];
  boot.blacklistedKernelModules = [ "b43" "bcma" ];

  # Kernel
  boot.kernelPackages = pkgs.linuxPackages_xanmod;

  services.logind.lidSwitch = "suspend-then-hibernate";
  services.logind.extraConfig = ''
    HandleLidSwitch=suspend-then-hibernate
    HibernateDelaySec=30min
  '';
}
