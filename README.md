# nix-config

#### configuration.nix
```nix
{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Asia/Tashkent";

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

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;  # Uncomment if needed
  };

  security.rtkit.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.ismoilovdev = {
    isNormalUser = true;
    description = "Otabek Ismoilov";
    extraGroups = [ "networkmanager" "wheel" "docker"];
    packages = with pkgs; [
       telegram-desktop
    ];
  };

  # Install firefox.
  sound.enable = true;
  programs.firefox.enable = true;
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.permittedInsecurePackages = [
    "openssl-1.1.1w"
    "pulsar-1.117.0"
  ];

  virtualisation.docker.enable = true;

  environment.systemPackages = with pkgs; [
    wget
    usbutils
    zsh
    bash
    neovim
    helix
    python3
    python312Packages.pip
    pipenv
    pipx
    nfs-utils
    nodejs_22
    pnpm
    go
    appimage-run
    cargo
    rustup
    ansible
    terraform
    rsync
    sassc
    telegram-desktop
    htop
    git
    tree
    dig
    glib
    glibc
    google-cloud-sdk-gce
    google-cloud-sdk
    gnome-extensions-cli
    gnome-extension-manager
    gnome.gnome-disk-utility
    gnome.gnome-tweaks
    gnome.nautilus
    gnome.gnome-shell
    gnome.gnome-terminal
    gnome.gnome-shell-extensions
    gnome.geary
    gnome.gnome-maps
    gnome.gnome-software
    gnome.gnome-calendar
    gnome.gnome-contacts
    whitesur-gtk-theme
    whitesur-icon-theme
    whitesur-cursors
    ulauncher
    zip
    rhythmbox
    shotwell
    vim
    anydesk
    pulsar
    nettools
    google-chrome
    spotify
    discord
    vscode
    obs-studio
    sublime4
    traceroute
    unzip
    neofetch
    curl
    flatpak
    flatpak-builder
    fuse
  ];

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Disable the firewall.
  networking.firewall.enable = false;

  system.stateVersion = "24.05"; # Did you read the comment?
}
```

#### hardware-configuration.nix

```nix
# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [ "xhci_pci" "vmd" "nvme" "usb_storage" "usbhid" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/500e475a-59bc-4d03-8aba-70577b4589bb";
      fsType = "ext4";
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/8E79-1BFF";
      fsType = "vfat";
      options = [ "fmask=0077" "dmask=0077" ];
    };

  swapDevices = [ ];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.wlo1.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
```
