pkgs: homeConfig:

homeConfig // {
  home = homeConfig.home // {
    packages = homeConfig.home.packages ++ [
      pkgs.neil # clojure project management
      pkgs.clojure
      pkgs.clj-kondo
    ];
  };
}
