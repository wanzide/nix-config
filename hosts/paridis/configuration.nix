{ config, lib, pkgs, ... }:

{
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "paridis";
  networking.networkmanager.enable = true;

  time.timeZone = "Asia/Shanghai";
  
  services.dbus.enable = true;
  services.xserver.enable = true;
  services.displayManager.gdm.enable = true;
  services.printing.enable = true;
  services.pulseaudio.enable = false;
  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };
  services.libinput.enable = true;
  services.gnome.gnome-keyring.enable = true;
  # Enable the OpenSSH daemon.
  services.openssh.enable = true;
  # U盘自动加载
  services.udisks2.enable = true;

  users.users.paridis = {
    isNormalUser = true;
    description = "paridis user";
    extraGroups = [ "wheel" ]; 
    packages = with pkgs; [
      tree
    ];
    hashedPassword = "$6$yH169ISULImSSenk$EQNPIrM4rFmNUy4vv5KG0lyniVg4B5UhIJYliN0Ml.nlv4JFskP.ZRQ0vTI86dsDbQRaJqoXzkia0orFtUI89/";
  };

  programs.xwayland.enable = true;
  programs.niri.enable = true;

  # xdg portal：文件选择器、截图、共享屏幕、外部链接打开都靠它
  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;  # 强烈建议开启，确保 xdg-open 走 portal
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
      # 如果你用 GNOME/KDE 可以换对应 portal，但 niri 建议 gtk
    ];
  };

  security.sudo.wheelNeedsPassword = false;
  security.pam.services.gdm.enableGnomeKeyring = true;


  hardware = {
    enableAllFirmware = true; # 自动安装所有固件
    cpu.intel.updateMicrocode = true; # Intel CPU
    # cpu.amd.updateMicrocode = true; # AMD CPU
  };

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs; [
      intel-media-driver
      intel-vaapi-driver
    ];
    extraPackages32 = with pkgs.pkgsi686Linux; [
      intel-media-driver
      intel-vaapi-driver
    ];
  };

  nix.settings.experimental-features = ["nix-command" "flakes"];
  nixpkgs.config.allowUnfree = true;


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
