pkgs: homeConfig:

homeConfig // {
  home = homeConfig.home // {
    packages = homeConfig.home.packages ++ [
      pkgs.fira-code # the font I use in emacs
      pkgs.ripgrep # since my emacs setup depends on ripgrep
    ];

    file = (homeConfig.home.file or {}) // {
      ".emacs.d" = {
        source = pkgs.fetchFromGitHub {
          owner = "luizalbertocviana";
          repo = "emacs.d";
          rev = "0420385b3d915e100d67dcabc0a28460fb42cfee";
          sha256 = "5lUEC92i1vd+pWRmAZcLPdtKaFtgw0+abQHqyjO2UYk=";
        };
        recursive = true;
      };
    };
  };

  programs = homeConfig.programs // {
    emacs.enable = true;
  };
}
