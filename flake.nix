{
  description = "paridis nixos 配置";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-25.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs-unstable"; # 只给 Noctalia 用
    };
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, noctalia, ... } @ inputs:
  let
    system = "x86_64-linux"; # 或 aarch64-linux
    hostname = "paridis";
    username = "paridis";
  in
  {
    nixosConfigurations.${hostname} = nixpkgs.lib.nixosSystem {
      inherit system;

      specialArgs = { inherit self; }; # 可选：传给 NixOS modules

      modules = [
        ./hosts/${hostname}

        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;

          home-manager.users.${username} = import ./home/${username};

          # 可选：传 inputs 给 home.nix 用
          home-manager.extraSpecialArgs = { inherit inputs; };
        }
      ];
    };
  };
}
