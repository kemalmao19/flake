{ pkgs, lib, ... }: {
  services.acpid.enable = true;

  powerManagement.enable = true;
  powerManagement.cpuFreqGovernor = "schedutil";

  # services.tlp.enable = true;
  services.mbpfan = {
    enable = true;
    settings = {
      general = {
        min_fan1_speed = 2000;
        max_fan1_speed = 6200;
        high_temp = 60;
        low_temp = 50;
        max_temp = 70;
      };
    };
  };

  # nixpkgs.config.packageOverrides = pkgs: {
  # intel-vaapi-driver =
  # pkgs.intel-vaapi-driver.override { enableHybridCodec = true; };
  # };

  hardware.graphics.extraPackages = with pkgs; [
    # vaapiIntel
    vaapiVdpau
    libvdpau-va-gl
    intel-media-driver
    intel-media-sdk
    intel-vaapi-driver
  ];

  environment.sessionVariables = { LIBVA_DRIVER_NAME = "i965"; };

  services.xserver.deviceSection = lib.mkDefault ''
    Option "TearFree" "true"
  '';

  hardware.facetimehd.enable = true;

  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  # Disabling wakeup triggers for all PCIe devices
  services.udev.extraRules = ''
    ACTION=="add", SUBSYSTEM=="pci", DRIVER=="pcieport", ATTR{power/wakeup}="disabled"
  '';
}
