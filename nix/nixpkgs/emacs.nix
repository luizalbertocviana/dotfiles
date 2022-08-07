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
          rev = "804e80d6f5b880a8e487292bd268a8211c19b66c";
          sha256 = "f+fowoVRg6tXPsXQ5tznmeamciOKmoY8KqoJujs2/Wg=";
        };
        recursive = true;
      };
    };
  };

  programs = homeConfig.programs // {
    emacs.enable = true;
  };
}
