pkgs: homeConfig:

homeConfig // {
  programs = homeConfig.programs // {
    direnv = {
      enable = true;
      enableBashIntegration = true;
    };
  };
}
