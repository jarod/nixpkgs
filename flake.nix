{
  description = "nix packages for personal use";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };
  };

  outputs =
    inputs @ { nixpkgs
    , flake-parts
    , ...
    }: flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "x86_64-linux" "aarch64-darwin" ];
      perSystem =
        { config
        , system
        , ...
        }:
        let
          pkgs = import nixpkgs {
            inherit system;
            config.allowUnsupportedSystem = true;
          };
        in
        { 
          packages = {
            nginxMailServer = pkgs.callPackage ./pkgs/servers/http/nginx/mailserver.nix {};
          };
        };
    };
}
