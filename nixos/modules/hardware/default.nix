{ pkgs, lib, ... }: {
  services.acpid.enable = true;

  # https://www.kernel.org/doc/Documentation/cpu-freq/governors.txt
  powerManagement.enable = true;
  powerManagement.cpuFreqGovernor = "powersave"; #schedutil powersave ondemand

  # services.tlp.enable = true;

  #intel cpu throttle
  # services.thermald.enable = true;

  # macbook fan control 
  services.mbpfan = {
    enable = true;
    settings = {
      general = {
        min_fan1_speed = 2000;
        max_fan1_speed = 6200;
        low_temp = 55;
        high_temp = 65;
        max_temp = 75;
      };
    };
  };

  hardware.graphics.extraPackages = with pkgs; [
    # vaapiIntel
    vaapiVdpau
    libvdpau-va-gl
    intel-vaapi-driver
  ];

  environment.sessionVariables = { LIBVA_DRIVER_NAME = "i965"; };

  services.xserver.deviceSection = lib.mkDefault ''
    Option "TearFree" "true"
  '';

  hardware.facetimehd.enable = true;

  # Enable sound with pipewire.
  services.playerctld.enable = true;

  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  # Kernel quirk for Cirrus Logic audio chip in MacBookPro 2012
  boot.kernelParams = [
    "snd_hda_intel.model=mbp101" # try mbp55 or mbp101 depending on exact model
    # "snd_hda_intel.probe_mask=1"
  ];

  hardware.graphics.enable32Bit = true;

}
