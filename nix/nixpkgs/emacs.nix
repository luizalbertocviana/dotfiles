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
          rev = "450fb26a87953909d2817ff6859ee9308ebeb80f";
          sha256 = "/1CS9HchrdHoKWVWkGRowrtPUxXWziyAyB/eVRQ7tWM=";
        };
        recursive = true;
      };
    };
  };

  programs = homeConfig.programs // {
    emacs.enable = true;
  };
}
