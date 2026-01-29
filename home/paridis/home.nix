{ config, pkgs, inputs, ... }:

{

  home.username = "paridis";
  home.homeDirectory = "/home/paridis";
  home.stateVersion = "25.11";

  programs.zsh.enable = true;

  home.packages = with pkgs; [
    google-chrome
 
    wechat
    feishu
    daed
    vscode
    telegram-desktop
  ];

  # 配置 Electron 应用在 Wayland 下的启动参数
  # 这将使 WeChat、VSCode、Feishu 等 Electron 应用支持 Wayland 和 fcitx5
  home.file.".config/electron-flags.conf".text = ''
    --enable-wayland-ime
    --ozone-platform-hint=auto
    --enable-features=WaylandWindowDecorations
  '';

  # 同样配置 Chrome/Chromium 标志
  home.file.".config/chrome-flags.conf".text = ''
    --enable-wayland-ime
    --ozone-platform-hint=auto
    --enable-features=WaylandWindowDecorations
  '';

  programs.home-manager.enable = true;


}
