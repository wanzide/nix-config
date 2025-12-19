{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    noevim
    wget
    git
    starship
    kitty
    fastfetch
    nerd-fonts.jetbrains-mono
    btop
    yazi
 ];

  # 启用 libvirt 服务，这是使用 virt-manager 的前提
  virtualisation.libvirtd = {
    enable = true;
   # 启用 virtiofsd 支持，这会自动处理 qemu 依赖
    qemu.vhostUserPackages = with pkgs; [ virtiofsd ];
  };
}
