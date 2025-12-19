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
    fuzzel
    alacritty
    bibata-cursors
 ];

  programs.niri.enable = true;

  environment.variables = {
    XCURSOR_THEME = "Bibata-Modern-Ice";
    XCURSOR_SIZE = "24";  
  };
  
}
