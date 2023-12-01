pkgs: homeConfig:

homeConfig // {
  home = homeConfig.home // {
    packages = homeConfig.home.packages ++ [
      pkgs.bat
      pkgs.eza
    ];
  };

  programs = homeConfig.programs // {
    bash = homeConfig.programs.bash // {
      bashrcExtra = homeConfig.programs.bash.bashrcExtra + ''
          export MANPAGER="sh -c 'col -bx | ${pkgs.bat}/bin/bat -l man -p'"
          alias cat=${pkgs.bat}/bin/bat
          alias ls=${pkgs.eza}/bin/eza
        '';
    };
  };
}
