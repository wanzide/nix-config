{ config, lib, pkgs, ... }:

{
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "paridis";

  networking.networkmanager.enable = true;

  time.timeZone = "Asia/Shanghai";

  services.xserver.enable = true;
  
  services.displayManager.gdm.enable = true;

  services.printing.enable = true;

  services.pulseaudio.enable = false;
  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  services.libinput.enable = true;

  users.users.paridis = {
    isNormalUser = true;
    description = "paridis user";
    extraGroups = [ "wheel" ]; 
    packages = with pkgs; [
      tree
    ];
    hashedPassword = "$6$yH169ISULImSSenk$EQNPIrM4rFmNUy4vv5KG0lyniVg4B5UhIJYliN0Ml.nlv4JFskP.ZRQ0vTI86dsDbQRaJqoXzkia0orFtUI89/";
  };
  security.sudo.wheelNeedsPassword = false;
  nixpkgs.config.allowUnfree = true;

  programs.xwayland.enable = true;
  programs.niri.enable = true;
  services.gnome.gnome-keyring.enable = true;
  security.pam.services.gdm.enableGnomeKeyring = true;

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;
  # U盘自动加载
  services.udisks2.enable = true;
  nix.settings.experimental-features = ["nix-command" "flakes"];
  imports = [
    inputs.noctalia.nixosModules.default
  ];
  # enable the systemd service
  services.noctalia-shell.enable = true;

  nix.settings = {
    substituters = [
      "https://mirrors.bfsu.edu.cn/nix-channels/store?priority=15"
      "https://mirrors.ustc.edu.cn/nix-channels/store?priority=10"
      "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store?priority=5"
      "https://cache.nixos.org/"
    ];
    download-buffer-size = 524288000;
  };
  system.stateVersion = "25.11";

}
