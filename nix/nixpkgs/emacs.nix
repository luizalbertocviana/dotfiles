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
          rev = "23e5b15c9ac7a31e68d7f8144819018988ff69e0";
          sha256 = "w+3VG6UrpeNOrXMb0T0f+TFWBl9jWsn5kp7WLb5MnKM=";
        };
        recursive = true;
      };
    };
  };

  programs = homeConfig.programs // {
    emacs.enable = true;
  };
}
