{
  description = "Home Manager configuration of elliot";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    rust-overlay = {
      url = "github:oxalica/rust-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    elliot-vim = {
      url = "github:Eliot00/ElliotVim/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, rust-overlay, elliot-vim, ... }:
    let
      system = "aarch64-darwin";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      homeConfigurations.elliot = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        # Specify your home configuration modules here, for example,
        # the path to your home.nix.
        modules = [
          ./home.nix
          elliot-vim.homeManagerModules.default
          ({ pkgs, ... }: {
            nixpkgs.overlays = [ rust-overlay.overlays.default ];
            home.packages = [
              (pkgs.rust-bin.stable.latest.default.override {
                extensions = [ "rust-src" ];
              })
            ];
          })
        ];

        # Optionally use extraSpecialArgs
        # to pass through arguments to home.nix
      };
    };
}
