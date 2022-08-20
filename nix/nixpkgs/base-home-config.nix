{
  config,
  pkgs,
  ...
}:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "luiz";
  home.homeDirectory = "/home/luiz";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "22.05";

  # Packages that should be installed to the user profile
  home.packages = [
    pkgs.google-chrome
    pkgs.maestral # dropbox client
    pkgs.megasync
    pkgs.rnix-lsp # language server for nix language
    pkgs.unzip
    pkgs.zathura
    pkgs.libreoffice
    pkgs.docker-compose
    pkgs.dbeaver
    pkgs.ripgrep
  ];

  # environment variables
  home.sessionVariables = {
    NIX_PATH = "/home/luiz/.nix-defexpr/channels:/nix/var/nix/profiles/per-user/root/channels:nixpkgs=/nix/var/nix/profiles/per-user/root/channels/nixos:nixos-config=/etc/nixos/configuration.nix:/nix/var/nix/profiles/per-user/root/channels";
    XDG_DATA_DIRS = "/var/lib/flatpak/exports/share:/home/luiz/.local/share/flatpak/exports/share:$XDG_DATA_DIRS";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # git
  programs.git = {
    enable = true;
    userName = "Luiz Alberto do Carmo Viana";
    userEmail = "luizalbertocviana@gmail.com";
    extraConfig = {
      credential.helper = "store";
    };
  };

  # let home manager manage bash
  programs.bash = {
    enable = true;
    bashrcExtra = ''
      . $HOME/.profile
    '';
  };
}
