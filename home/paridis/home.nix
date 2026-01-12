{ config, pkgs, inputs, ... }:

{

  home.username = "paridis";
  home.homeDirectory = "/home/paridis";
  home.stateVersion = "25.11";

  programs.zsh.enable = true;

  home.packages = with pkgs; [
    google-chrome
 
    # wechat
    # clash-verge-rev
    vscode
    telegram-desktop
  ];

  programs.home-manager.enable = true;


}
