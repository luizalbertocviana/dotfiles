pkgs: homeConfig:

homeConfig // {
  home = homeConfig.home // {
    packages = homeConfig.home.packages ++ [
      pkgs.leiningen # clojure project management
      pkgs.clojure-lsp
    ];
  };
}
