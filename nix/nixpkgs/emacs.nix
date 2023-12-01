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
          rev = "6c4ab02f6f0b0e33f66d362ab52707f293df985b";
          sha256 = "RNrIDeptjre/kE7JSlitepP+QjWfSvRj1zkW6FM/t+g=";
        };
        recursive = true;
      };
    };
  };

  programs = homeConfig.programs // {
    emacs.enable = true;
  };
}
