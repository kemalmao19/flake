# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ pkgs, lib, ... }:

{
  imports = [ # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.plymouth.enable = true;
  boot.initrd.systemd.enable = true;

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
    # DE
    desktopManager = {
      # budgie.enable = true;
      # pantheon.enable = true;
      gnome.enable = true;
      # xfce.enable = true;
      # enlightenment.enable = true;
    };
  };

  # DM
  services.displayManager = {
    sddm.enable = true;
    sddm.theme = "${import ./sddm-theme.nix { inherit pkgs; }}";
  };

  # Pantheo Desktop
  # services.xserver.desktopManager.pantheon.extraWingpanelIndicators
  # services.xserver.desktopManager.pantheon.extraSwitchboardPlugs 
  # xdg.portal.enable = true;
  # xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  # programs.pantheon-tweaks.enable = true;

  # Enable CUPS to print documents.
  services.printing = {
    enable = true;
    drivers = [
      #pkgs.epson-201401w pkgs.hplip 
    ];
  };

  # Scanner
  hardware.sane = {
    enable = true;
    extraBackends = [
      #pkgs.hplipWithPlugin 
    ];
  };

  # Enable sound with pipewire.
  sound.enable = true;
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
  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.kemalmao = {
    isNormalUser = true;
    description = "kemalmao";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.fish;
    packages = with pkgs; [
      firefox-esr
      # chromium
      # libreoffice-fresh
      # dbeaver
      xarchiver
      #  thunderbird
    ];
  };

  # fonts
  # fonts.fonts = with pkgs;
  #  [ (nerdfonts.override { fonts = [ "FiraCode" "Hack" "Iosevka" ]; }) ];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  services.flatpak.enable = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs;
    [
      whitesur-icon-theme
      apple-cursor

      # conky

      # sddm dependecy
      libsForQt5.qt5.qtquickcontrols2
      libsForQt5.qt5.qtgraphicaleffects

      # CPU autofreq
      # auto-cpufreq

      # patheon
      # pantheon.appcenter

    ]
    ++ (with gnomeExtensions; [ gsconnect appindicator hide-top-bar dashbar ]);

  programs.fish.enable = true;

  # Mariadb 
  # services.mysql = {
  # package = pkgs.mariadb;
  # enable = true;
  # dataDir = "/home/kemal/mysql/data"; # By default the data is stored in /var/lib/mysql
  # };

  # systemd cpu
  # systemd.packages = [ pkgs.auto-cpufreq ];
  # systemd.services.auto-cpufreq.path = with pkgs; [ bash coreutils ];

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

  hardware.opengl.extraPackages = with pkgs; [
    vaapiIntel
    vaapiVdpau
    libvdpau-va-gl
    intel-media-driver
  ];
  boot = {
    kernelModules = [ "applesmc" "i915" ];
    # https://forum.manjaro.org/t/kworker-kacpid-over-70-of-cpu-dual-boot-mac-manjaro/61981
    kernelParams = [ "acpi_mask_gpe=0x17" "quite" ];
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

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?

  # Flatpak
  # services.flatpak.enable = true;

  # flake
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Kernel
  # boot.kernelPackages = pkgs.linuxPackages_6_4;

  # CPU auto services
  # services.auto-cpufreq.enable = true;

}
