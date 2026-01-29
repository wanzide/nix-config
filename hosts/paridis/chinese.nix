{ config, pkgs, lib, ... }: {
# 设置系统的中文环境
  i18n = {
    defaultLocale = "zh_CN.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "zh_CN.UTF-8";
      LC_IDENTIFICATION = "zh_CN.UTF-8";
      LC_MEASUREMENT = "zh_CN.UTF-8";
      LC_MONETARY = "zh_CN.UTF-8";
      LC_NAME = "zh_CN.UTF-8";
      LC_NUMERIC = "zh_CN.UTF-8";
      LC_PAPER = "zh_CN.UTF-8";
      LC_TELEPHONE = "zh_CN.UTF-8";
      LC_TIME = "zh_CN.UTF-8";
   };

   supportedLocales = [ "zh_CN.UTF-8/UTF-8" "en_US.UTF-8/UTF-8" ];
  };

  # 输入法配置（Fcitx5）
  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5.addons = with pkgs; [
      qt6Packages.fcitx5-chinese-addons # fcitx5-chinese-addons
      fcitx5-gtk
      qt6Packages.fcitx5-configtool  # fcitx5-configtool
      fcitx5-nord 
    ];
    fcitx5.waylandFrontend = true;
  };

  # 设置 fcitx5 环境变量（Wayland 下不需要 GTK_IM_MODULE 等）
  environment.sessionVariables = {
    # Fcitx5 在 Wayland 下使用 Input Method v2 协议
    # 不要设置 GTK_IM_MODULE, QT_IM_MODULE, XMODIFIERS
    # 这些会干扰 Wayland 原生输入法支持
  };

  # 中文字体优化
  fonts = {
    packages = with pkgs; [
      cascadia-code
      noto-fonts 
      noto-fonts-cjk-sans    # 思源黑体 (无衬线)
      noto-fonts-cjk-serif   # 思源宋体 (衬线)
      ];
    fontconfig = {
      defaultFonts = {
        sansSerif = [ "Noto Sans CJK SC" ];
        serif = [ "Noto Serif CJK SC" ];
      #  monospace = [ "Noto Sans Mono CJK SC" ];
      };
    };
 };
}
