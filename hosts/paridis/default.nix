{ config, pkgs, lib, ... }:
let
	dir = ./.;
	files = builtins.filter (f: f != "default.nix" && builtins.match ".+\\.nix$" f != null) (builtins.attrNames (builtins.readDir dir));
	modules = map (f: ./${f}) files;
in {
	imports = modules;
}

