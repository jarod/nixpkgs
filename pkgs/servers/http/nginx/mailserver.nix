{ callPackage, ... } @ args:

callPackage ./generic.nix args {
  pname = "nginxMailServer";
  version = "1.20.2";
  hash = "sha256-lYh2dXeCGQoWU+FNwm38e6Jj3jEOBMET4R6X0b70WkI=";
  configureFlags = [
    "--sbin-path=bin/nginx"
    "--with-pcre-jit"
    "--with-http_slice_module"
    "--with-http_realip_module"
    "--with-http_stub_status_module"
    "--with-http_ssl_module"
    "--with-http_v2_module"
    "--with-http_gzip_static_module"
    "--with-http_sub_module"
    "--with-stream"
    "--with-stream_ssl_module"
  ];
}