pkgs: homeConfig:

let
  nethack4 = (import (pkgs.fetchFromGitHub {
    owner = "luizalbertocviana";
    repo = "nethack4-nix";
    rev = "f318b6cb3087e3464e9ea5c96dac563f3b2c4300";
    sha256 = "ooE1fweAC2fnUzq/6/tmIDYdM2nNl2V3VZS3HR6ZRSA=";
  })) {};
in
  homeConfig // {
    home = homeConfig.home // {
      packages = homeConfig.home.packages ++ [
        nethack4
      ];
    };
  }
