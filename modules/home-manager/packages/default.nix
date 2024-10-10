{ config
, pkgs
, lib
, ...
}:
let
  globals = with pkgs; [
    wget
    zsh
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
    rustup
    ansible
    terraform
    rsync
    sassc
    htop
    git
    tree
    dig
    glib
    glibc
    google-cloud-sdk-gce
    google-cloud-sdk
    zip
    rhythmbox
    shotwell
    vim
    pulsar
    nettools
    traceroute
    unzip
    neofetch
    curl
  ];
in
{
  config = {
    # Packages to be installed on my machine
    home.packages = globals;
  };
}
