pkgs: homeConfig:

homeConfig // {
  home = homeConfig.home // {
    packages = homeConfig.home.packages ++ [
      pkgs.jdk
      pkgs.maven
    ];
  };
  programs = homeConfig.programs // {
    bash = homeConfig.programs.bash // {
      bashrcExtra = homeConfig.programs.bash.bashrcExtra + ''
        export JAVA_HOME="${pkgs.jdk}/lib/openjdk"
      '';
    };
  };
}
