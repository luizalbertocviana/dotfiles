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
          rev = "b36726f557b37c4d97f1c75ef798fb0f5673e51f";
          sha256 = "81SmHx9JDD2R3Kt0n25tmAExOq6iCuYm60qH9KTH3q0=";
        };
        recursive = true;
      };
    };
  };

  programs = homeConfig.programs // {
    emacs.enable = true;
  };
}
