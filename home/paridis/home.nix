{ config, pkgs, inputs, ... }:

{

  home.username = "paridis";
  home.homeDirectory = "/home/paridis";
  home.stateVersion = "25.11";

  programs.zsh.enable = true;

  programs.niri.enable = true;

  home.packages = with pkgs; [
    google-chrome
    feishu
    wechat
    clash-verge-rev
  ];

  programs.home-manager.enable = true;


}
