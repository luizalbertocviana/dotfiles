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
          rev = "0b748cd05d91ba4d9b8dc9753ccfa34e20b00b0d";
          sha256 = "JCjGV9H+eRPHdKUYHpDZyO47A5xNbMg8Qs2oNof3Qf8=";
        };
        recursive = true;
      };
    };
  };

  programs = homeConfig.programs // {
    emacs.enable = true;
  };
}
