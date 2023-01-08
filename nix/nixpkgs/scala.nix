pkgs: homeConfig:

homeConfig // {
  home = homeConfig.home // {
    packages = homeConfig.home.packages ++ [
      pkgs.jdk
      pkgs.coursier
    ];
  };
  programs = homeConfig.programs // {
    bash = homeConfig.programs.bash // {
      bashrcExtra = homeConfig.programs.bash.bashrcExtra + ''
        export JAVA_HOME="${pkgs.jdk}/lib/openjdk"
        export PATH="$PATH:$HOME/.local/share/coursier/bin"
      '';
    };
  };
}
