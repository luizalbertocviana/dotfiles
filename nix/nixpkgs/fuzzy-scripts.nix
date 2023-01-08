pkgs: homeConfig:

let
  fuzzyScripts = (import
    (pkgs.fetchFromGitHub {
      owner = "luizalbertocviana";
      repo = "fuzzy-scripts";
      rev = "8ff8847f666e2526b1431d57cda837789a8b9f0b";
      sha256 = "vRdja3qTR8VL4ClzsB4rLfch4gLxHYQ0xD/QMeo5z5Y=";
    })
  ) {};
in
  homeConfig // {
    home = homeConfig.home // {
      packages = homeConfig.home.packages ++ [
        fuzzyScripts.hist
        fuzzyScripts.jump
        fuzzyScripts.murder
      ];
    };

    programs = homeConfig.programs // {
      bash = homeConfig.programs.bash // {
        bashrcExtra = homeConfig.programs.bash.bashrcExtra + ''
          . jump
        '';
      };
    };
  }
