{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    neovim
    wget
    git
    starship
    kitty
    fastfetch
    nerd-fonts.jetbrains-mono
    btop
    yazi
    fuzzel
    alacritty
    bibata-cursors

    # Portal
    xdg-desktop-portal
    xdg-desktop-portal-gtk
    xdg-utils

    # Electron 基础库
    glib gtk3 gsettings-desktop-schemas
    nss nspr dbus

    # GPU/渲染
    mesa libdrm vulkan-loader
    # 字体
    noto-fonts noto-fonts-cjk-sans noto-fonts-emoji
 ];

  environment.variables = {
    XCURSOR_THEME = "Bibata-Modern-Ice";
    XCURSOR_SIZE = "24";  
  };
  
}
