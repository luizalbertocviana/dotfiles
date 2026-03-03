pkgs: homeConfig:

homeConfig // {
  home = homeConfig.home // {
    packages = homeConfig.home.packages ++ [
      pkgs.python3
      pkgs.pyright
      pkgs.uv
    ];
  };
}
