{ pkgs, lib, ... }: {
  services.acpid.enable = true;

  # https://www.kernel.org/doc/Documentation/cpu-freq/governors.txt
  powerManagement.enable = true;
  powerManagement.cpuFreqGovernor = "schedutil"; # schedutil powersave ondemand

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
        low_temp = 50;
        high_temp = 60;
        max_temp = 70;
      };
    };
  };

   hardware.graphics.extraPackages = with pkgs; [
    # vaapiIntel
    libva-vdpau-driver
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
  services.pulseaudio.enable = false;

  hardware.graphics.enable32Bit = true;
  boot.extraModprobeConfig = ''
    options snd-hda-intel model=mbp101
  '';
}
