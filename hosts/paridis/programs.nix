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
 ];

  environment.variables = {
    XCURSOR_THEME = "Bibata-Modern-Ice";
    XCURSOR_SIZE = "24";  
  };
  
}
