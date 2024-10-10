{ config, pkgs, inputs, outputs, ... }:

{
  imports =
    [
      # Module configurations
      outputs.nixosModules.zsh
      outputs.nixosModules.grub
      outputs.nixosModules.gnome
      outputs.nixosModules.fonts
      outputs.nixosModules.nixpkgs

      # Include the results of the hardware scan.
      ./hardware-configuration.nix

      # Home Manager NixOS Module
      inputs.home-manager.nixosModules.home-manager
    ];

  networking.hostName = "Experiment"; # Define your hostname.
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

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true; # Uncomment if needed
  };

  security.rtkit.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.ismoilovdev = {
    isNormalUser = true;
    description = "Otabek Ismoilov";
    extraGroups = [ "networkmanager" "wheel" "docker" ];
    packages = with pkgs; [
      telegram-desktop
      google-chrome
      spotify
      vscode
      obs-studio
      ulauncher
      sublime4
      anydesk
    ];
  };

  home-manager = {
    extraSpecialArgs = { inherit inputs outputs; };
    users = {
      # Import your home-manager configuration
      ismoilovdev = import ../../home-manager/home.nix;
    };
  };

  # Don't ask for password
  security.sudo.wheelNeedsPassword = false;

  # Docker virtualization
  virtualisation.docker.enable = true;

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Disable the firewall.
  networking.firewall.enable = false;

  system.stateVersion = "24.05"; # Did you read the comment?
}
