{ pkgs, lib, ... }: {
  services.acpid.enable = true;

  powerManagement.enable = true;
  # powerManagement.cpuFreqGovernor = "schedutil";

  services.mbpfan = {
    enable = true;
    #settings = {
    #  general = {
    #    min_fan1_speed = 2000;
    #    max_fan1_speed = 6200;
    #    high_temp = 61;
    #    low_temp = 55;
    #    max_temp = 87;
    #  };
    #};
  };

  hardware.cpu.intel.updateMicrocode = true;

  hardware.graphics.extraPackages = with pkgs; [
    vaapiIntel
    vaapiVdpau
    libvdpau-va-gl
    intel-media-driver
  ];

  services.xserver.deviceSection = lib.mkDefault ''
    Option "TearFree" "true"
  '';

  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # CPU auto services
  # services.auto-cpufreq.enable = true;  

  # systemd cpu
  # systemd.packages = [ pkgs.auto-cpufreq ];
  # systemd.services.auto-cpufreq.path = with pkgs; [ bash coreutils ];
}
