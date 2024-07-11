{ pkgs, system, ... } @ args:
let
  # glibc-pkgs = (import
  #   (fetchTarball "https://github.com/NixOS/nixpkgs/archive/7144d6241f02d171d25fba3edeaf15e0f2592105.tar.gz")
  #   {
  #     inherit system;
  #     #  config =  { allowBroken=true; allowUnfree=true; };
  #   });
  # glibc-pkgs = (import
  #   (builtins.fetchGit {
  #     name = "glibc_2_37";
  #     url = "https://github.com/NixOS/nixpkgs/";
  #     ref = "refs/heads/nixos-23.11";
  #     rev = "b23e08124df73322d5e8000c013148e04cf22caa";
  #     shallow = true;
  #   })
  #   { inherit system; });
in
pkgs.callPackage ./generic.nix
  (args // {
    withSlice = true;
    # stdenv = glibc-pkgs.gcc6Stdenv;
  })
{
  pname = "nginxMailServer";
  version = "1.20.2";
  hash = "sha256-lYh2dXeCGQoWU+FNwm38e6Jj3jEOBMET4R6X0b70WkI=";
  # nativeBuildInputs = [ pkgs.glibc gcc ];
  buildInputs = [ pkgs.libxcrypt ];
  # configureFlags = [
  #   "--sbin-path=bin/nginx"
  #   "--with-pcre-jit"
  # "--with-http_slice_module"
  #   "--with-http_realip_module"
  #   "--with-http_stub_status_module"
  #   "--with-http_ssl_module"
  #   "--with-http_v2_module"
  #   "--with-http_gzip_static_module"
  #   "--with-http_sub_module"
  # "--with-stream"
  # "--with-stream_ssl_module"
  # ];
}
