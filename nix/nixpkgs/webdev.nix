pkgs: homeConfig:

homeConfig // {
  home = homeConfig.home // {
    packages = homeConfig.home.packages ++ [
      pkgs.html-tidy
      pkgs.stylelint
      pkgs.jsbeautifier
    ];
  };
}
