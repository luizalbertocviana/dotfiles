pkgs: homeConfig:

homeConfig // {
  home = homeConfig.home // {
    packages = homeConfig.home.packages ++ [
      pkgs.cargo
      pkgs.rust-analyzer
      pkgs.rustc
    ];
  };
}
