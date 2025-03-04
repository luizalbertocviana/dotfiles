pkgs: homeConfig:

homeConfig // {
  home = homeConfig.home // {
    packages = homeConfig.home.packages ++ [
      pkgs.nerd-fonts.fira-code # the font I use in emacs
    ];

    file = (homeConfig.home.file or {}) // {
      ".emacs.d" = {
        source = pkgs.fetchFromGitHub {
          owner = "luizalbertocviana";
          repo = "emacs.d";
          rev = "d4b5901e241e70d2fae727e4e2fbe4268ac2ae68";
          sha256 = "KP+9MFkY3qWctUV/sewvdn/pUOlNNXZCrPYHBw2zdHw=";
        };
        recursive = true;
      };
    };
  };

  programs = homeConfig.programs // {
    emacs.enable = true;
  };
}
