pkgs: homeConfig:

homeConfig // {
  home = homeConfig.home // {
    packages = homeConfig.home.packages ++ [
      pkgs.fira-code # the font I use in emacs
    ];

    file = (homeConfig.home.file or {}) // {
      ".emacs.d" = {
        source = pkgs.fetchFromGitHub {
          owner = "luizalbertocviana";
          repo = "emacs.d";
          rev = "bee9278457469bbc3d16932f00a376b07e0f8161";
          sha256 = "hEo+CH8bHJS+Gf+6ZepO0sX21BcEe82Ch9xVe15ok/Q=";
        };
        recursive = true;
      };
    };
  };

  programs = homeConfig.programs // {
    emacs.enable = true;
  };
}
