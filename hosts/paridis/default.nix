{ config, pkgs, lib, ... }:

{
	imports = [
    ./hardware-configuration.nix
    ./configuration.nix
    ./nvidia.nix
    ./chinese.nix
    ./programs.nix
  ];
}

