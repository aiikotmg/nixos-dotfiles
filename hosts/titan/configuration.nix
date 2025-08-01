# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page

# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, lib, inputs, ... }:




{
  imports =
    [ # Include the results of the hardware scan.
    

      inputs.home-manager.nixosModules.default
     # <home-manager/nixos>
      ./hardware-configuration.nix
#      ./modules/firefox.nix


      #local machine specific
      "${inputs.nixos-hardware}/common/cpu/intel/sandy-bridge"
      "${inputs.nixos-hardware}/lenovo/thinkpad/x230"

      #./modules/game.nix
#      ./modules/security.nix
#      ./modules/1pass.nix
      
    ];


  #
  # BOOT
  #


  # Bootloader.
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.useOSProber = true;

  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.kernelModules = [ "phc-intel" "thinkpad_acpi" "thinkpad_hwmon" ];
  boot.supportedFilesystems = [ "ntfs" ];

  boot.initrd.luks.devices."luks-ecf6151f-5e24-4dec-b7e3-0f4008d680b0".device = "/dev/disk/by-uuid/ecf6151f-5e24-4dec-b7e3-0f4008d680b0";
  # Setup keyfile
  boot.initrd.secrets = {
    "/crypto_keyfile.bin" = null;
  };

  boot.loader.grub.enableCryptodisk=true;

  boot.initrd.luks.devices."luks-47f96110-5202-4816-ab17-d7b2d23b5109".keyFile = "/crypto_keyfile.bin";
  boot.initrd.luks.devices."luks-ecf6151f-5e24-4dec-b7e3-0f4008d680b0".keyFile = "/crypto_keyfile.bin";


    #
    # NETWORK
    #


  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;


  # Enable the OpenSSH daemon.
  services.openssh = {
    enable = true;
    #extraConfig = "
  };

  services.tailscale.enable = true;
#  services.mullvad-vpn.enable = true;


  #
  # POWER MANAGEMENT
  #

  services.power-profiles-daemon.enable = false;
  powerManagement.enable = true;
  services.upower.enable = true;
  services.thermald.enable = true;
  services.tlp.enable = true;
 
  services.auto-cpufreq.enable = true;
  services.auto-cpufreq.settings = {
    battery = {
       governor = "powersave";
       turbo = "never";
    };
    charger = {
       governor = "powersave"; #default: preformance
       turbo = "never"; #default: auto
    };
  };


  services.greetd = {
    enable = true;                
    settings = {
    default_session = {
    command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd sway";
    user = "greeter";                                                  
      };                                                                   
    };                                                                     
  };


  #
  # LOCAL STUFF
  #

  # Set your time zone.
  time.timeZone = "America/Chicago";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };



  #
  # HARDWARE/OPTIMIZATION
  #

  security.polkit.enable = true;

# Enables flakes.nix 

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Do the garbage collection & optimisation daily.

  nix.gc.automatic = true;
  nix.optimise.automatic = true;
  nix.settings.auto-optimise-store = true;

  
  hardware = {
    enableAllFirmware = true;
    ksm.enable = true;
    cpu.intel.updateMicrocode = true;
#    sensor.iio.enable = true;
    bluetooth.enable = true;
    bluetooth.powerOnBoot = true;
    graphics = {
      enable = true;
      extraPackages = with pkgs; [
   

      ];
    };
  };



  services.xserver.enable = true; 
  #services.xserver.displayManager.sddm.enable = true; 
  #portal.enable = true;
  #portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ]; 
  services.libinput.enable = true; # Allows use of laptop touchpad.



  # Enable sound with pipewire

#  sound.enable = true;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
#    alsa.support32bit = true;
    pulse.enable = true;
    jack.enable = true;
  };


  # Define a user account. Don't forget to set a password with ‘passwd’.

  users.users.hermes = {
    isNormalUser = true;
    description = "hermes";
    extraGroups = [ "networkmanager" "wheel" "video" ];
    packages = with pkgs; [

    
    ];
  };


  # home manager

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      "hermes" = import ./home.nix;
    };
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  # most packages on are in the home.nix file

  environment.systemPackages = with pkgs; [
 
    vim
    ranger
    gcc
    librewolf
    firefox
    networkmanagerapplet
    killall
    
  ];

  # Fonts 

  fonts.fontDir.enable = true;
  fonts.packages = with pkgs; [
    nerd-fonts._0xproto
    font-awesome
    udev-gothic
    jetbrains-mono
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

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
  system.stateVersion = "23.11"; # Did you read the comment?

}
