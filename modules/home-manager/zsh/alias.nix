{ pkgs, lib, ... }:
let
  default = {
    # General aliases
    down = "cd ~/Downloads";
    ".." = "cd ..";
    "...." = "cd ../..";
    "celar" = "clear";
    ":q" = "exit";
    # neofetch = "fastfetch";
    ssh-hosts = "grep -P \"^Host ([^*]+)$\" $HOME/.ssh/config | sed 's/Host //'";

    # Refresh
    clean = "nix store gc && nix collect-garbage -d";

    # Polite motherfucker!
    # Do you speak it?!
    please = "sudo";
    move = "mv";
    copy = "cp";
    remove = "rm";
    list = "ls";
    edit = "hx";
    open = "xdg-open";

    # Made with Rust
    # top = "btop";
    # cat = "bat";
    # ls = "eza";
    # sl = "eza";
    # ps = "procs";
    # grep = "rg";
    # search = "rg";
    # look = "fd";
    # find = "fd";
    # ping = "gping";
    # time = "hyperfine";
    # korgi = "cargo";

    # Refresh
    refresh = "source ~/.zshrc";

    # Development
    # hack = "zellij";
    # vim = "hx";
    # nvim = "hx";
    # zednix = "nohup zed --new --foreground . &";
    # zn = "nohup zed --new --foreground . &";

    # Others (Developer)
    ports = "sudo lsof -PiTCP -sTCP:LISTEN";
    # rit = "gitui";
    dotenv = "eval export $(cat .env)";
    xclip = "xclip -selection c";
    speedtest = "curl -o /dev/null cachefly.cachefly.net/100mb.test";
    dockfm = "docker ps --all --format \"NAME:   {{.Names}}\nSTATUS: {{.Status}}\nPORTS:  {{.Ports}}\n\"";

    # Updating system
    update = "nix store gc && topgrade";
    nix-shell = "nix-shell --run zsh";
    nix-develop = "nix develop -c \"$SHELL\"";
  };

  cfg = lib.mkMerge [
    default
  ];
in
{
  config = {
    programs.zsh.shellAliases = cfg;
  };
}
