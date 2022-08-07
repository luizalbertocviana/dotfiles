pkgs: homeConfig:

let
  fuzzyScripts = (import
    (pkgs.fetchFromGitHub {
      owner = "luizalbertocviana";
      repo = "fuzzy-scripts";
      rev = "2b2357340102688f70c87362c43b9139f76e32d8";
      sha256 = "OgeiJypD6AMaZK7ISwc1HiS5kKQFKawGna6AmySxBts=";
    })
  ) {};
in
  homeConfig // {
    home = homeConfig.home // {
      packages = homeConfig.home.packages ++ [
        fuzzyScripts.hist
        fuzzyScripts.jump
      ];
    };

    programs = homeConfig.programs // {
      bash = homeConfig.programs.bash // {
        enable = true;
        bashrcExtra = homeConfig.programs.bash.bashrcExtra + ''
          . jump
        '';
      };
    };
  }
