pkgs: homeConfig:

let
  fuzzyScripts = (import
    (pkgs.fetchFromGitHub {
      owner = "luizalbertocviana";
      repo = "fuzzy-scripts";
      rev = "496c8c6d311ccef349ce8022bcf9dc588f9e7f59";
      sha256 = "JIzNOFBVW094UitmWL9JVrCYuOp+qVeK+XiuSR/6kRs=";
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
        enable = true;
        bashrcExtra = homeConfig.programs.bash.bashrcExtra + ''
          . jump
        '';
      };
    };
  }
