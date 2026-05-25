{
  description = "paridis NixOS system configuration";

  # Substituters here take effect during evaluation of this flake itself
  # (i.e. on the very first `nixos-rebuild --flake` before the system config
  # is activated), so bootstrapping a fresh machine already uses the mirror.
  nixConfig = {
    substituters = [
      "https://mirrors.ustc.edu.cn/nix-channels/store"
      "https://cache.nixos.org/"
    ];
  };

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs, ... }: {
    nixosConfigurations.matebook = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./configuration.nix
      ];
    };
  };
}
