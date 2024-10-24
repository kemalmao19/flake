{ pkgs, lib, ... }:

{
  imports = [ # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ./ui/default.nix
  ];

  system.stateVersion = "24.05";

  # flake
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "NixbookPro"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Asia/Jakarta";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.inputMethod = {
    enable = true;
    type = "ibus";
    ibus.engines = with pkgs.ibus-engines; [ mozc ];
  };

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "id_ID.UTF-8";
    LC_IDENTIFICATION = "id_ID.UTF-8";
    LC_MEASUREMENT = "id_ID.UTF-8";
    LC_MONETARY = "id_ID.UTF-8";
    LC_NAME = "id_ID.UTF-8";
    LC_NUMERIC = "id_ID.UTF-8";
    LC_PAPER = "id_ID.UTF-8";
    LC_TELEPHONE = "id_ID.UTF-8";
    LC_TIME = "id_ID.UTF-8";
  };

  # Enable the X11 windowing system
  # Configure keymap in X11
  services.xserver = {
    enable = true;
    xkb.layout = "us";
    xkb.variant = "";
  };

  # Enable CUPS to print documents.
  services.printing = {
    enable = true;
    drivers = [ pkgs.epson-201401w pkgs.hplip ];
  };

  # Scanner
  hardware.sane = {
    enable = true;
    extraBackends = [ pkgs.hplipWithPlugin ];
  };

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

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.kemalmao = {
    isNormalUser = true;
    description = "kemalmao";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.fish;
    packages = with pkgs; [ firefox-esr xarchiver ];
  };
  programs.fish.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  services.flatpak.enable = true;

  environment.systemPackages = with pkgs;
    [
      # CPU autofreq
      # auto-cpufreq
    ];

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

  boot = {
    kernelModules = [ "applesmc" "i915" ];
    # https://forum.manjaro.org/t/kworker-kacpid-over-70-of-cpu-dual-boot-mac-manjaro/61981
    kernelParams = [ "acpi_mask_gpe=0x17" ];
  };

  services.xserver.deviceSection = lib.mkDefault ''
    Option "TearFree" "true"
  '';

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Kernel
  # boot.kernelPackages = pkgs.linuxPackages_6_4;

  # CPU auto services
  # services.auto-cpufreq.enable = true;  

  # systemd cpu
  # systemd.packages = [ pkgs.auto-cpufreq ];
  # systemd.services.auto-cpufreq.path = with pkgs; [ bash coreutils ];

  # Mariadb 
  # services.mysql = {
  # package = pkgs.mariadb;
  # enable = true;
  # dataDir = "/home/kemal/mysql/data"; # By default the data is stored in /var/lib/mysql
  # };

}
