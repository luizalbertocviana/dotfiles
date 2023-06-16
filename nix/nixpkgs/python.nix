pkgs: homeConfig:

homeConfig // {
  home = homeConfig.home // {
    packages = homeConfig.home.packages ++ [
      pkgs.python3
      pkgs.python311Packages.python-lsp-server
      pkgs.poetry
    ];
  };
}
