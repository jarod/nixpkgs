{ pkgs, callPackage, system, ... } @ args:
let
  # glibc-pkgs = (import
  #   (builtins.fetchGit {
  #     name = "glibc_2_19";
  #     url = "https://github.com/NixOS/nixpkgs/";
  #     ref = "refs/heads/release-14.12";
  #     rev = "1b55b07eeb43ba41470eed1ce21991df96110e70";
  #   })
  #   { inherit system; });
  # glibc_2_19 = glibc-pkgs.glibc;

  # gcc5 = (import
  #   (builtins.fetchGit {
  #     name = "gcc_5_5_0";
  #     url = "https://github.com/NixOS/nixpkgs/";
  #     ref = "refs/heads/release-18.03";
  #     rev = "3e1be2206b4c1eb3299fb633b8ce9f5ac1c32898";
  #   })
  #   { inherit system; }).gcc5;
  # gcc-unwrapped_5 = gcc5.cc;
  # gcc = pkgs.gcc6;

  # getCustomGccStdenv = customGcc: customGlibc: origStdenv: { pkgs, ... }:
  #   with pkgs; let
  #     compilerWrapped = wrapCCWith {
  #       cc = customGcc;
  #       bintools = wrapBintoolsWith {
  #         bintools = binutils-unwrapped;
  #         libc = customGlibc;
  #       };
  #     };
  #   in
  #   overrideCC origStdenv compilerWrapped;
  # glibc_2_19_gcc_5 = getCustomGccStdenv gcc.cc pkgs.glibc pkgs.stdenv pkgs;
in
callPackage ./generic.nix
  (args // {
    withSlice = true;
    stdenv = pkgs.gcc6Stdenv;
  })
{
  pname = "nginxMailServer";
  version = "1.20.2";
  hash = "sha256-lYh2dXeCGQoWU+FNwm38e6Jj3jEOBMET4R6X0b70WkI=";
  # nativeBuildInputs = [ pkgs.glibc gcc ];
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
