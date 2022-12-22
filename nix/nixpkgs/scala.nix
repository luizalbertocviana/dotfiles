pkgs: homeConfig:

homeConfig // {
  home = homeConfig.home // {
    packages = homeConfig.home.packages ++ [
      pkgs.sbt
    ];
  };
}
