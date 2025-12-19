{ config, pkgs, inputs, ... }:

{

  home.username = "paridis";
  home.homeDirectory = "/home/paridis";
  home.stateVersion = "25.11";

  imports = [
    inputs.dms.homeModules.dankMaterialShell.default
    inputs.dms.homeModules.dankMaterialShell.niri
  ];

  programs.zsh.enable = true;
  programs.dankMaterialShell = {
    enable = true;
    niri = {
      enableKeybinds = true;   # Sets static preset keybinds
      enableSpawn = true;      # Auto-start DMS with niri and cliphist, if enabled
    };
    systemd = {
      enable = true;             # Systemd service for auto-start
      restartIfChanged = true;   # Auto-restart dms.service when dankMaterialShell changes
    };
    
    # Core features
    enableSystemMonitoring = true;     # System monitoring widgets (dgop)
    enableClipboard = true;            # Clipboard history manager
    enableVPN = true;                  # VPN management widget
    enableDynamicTheming = true;       # Wallpaper-based theming (matugen)
    enableAudioWavelength = true;      # Audio visualizer (cava)
    enableCalendarEvents = true;       # Calendar integration (khal)
  };

  home.packages = with pkgs; [
    google-chrome
    feishu
    wechat
    clash-verge-rev
  ];

  programs.home-manager.enable = true;


}
