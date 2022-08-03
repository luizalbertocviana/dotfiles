{
  config,
  pkgs,
  ...
}:

let
  # nethack4 derivation
  nethack4 = (import
    (pkgs.fetchFromGitHub {
      owner = "luizalbertocviana";
      repo = "nethack4-nix";
      rev = "f318b6cb3087e3464e9ea5c96dac563f3b2c4300";
      sha256 = "ooE1fweAC2fnUzq/6/tmIDYdM2nNl2V3VZS3HR6ZRSA=";
    })
  ) {};
  fuzzyScripts = (import
    (pkgs.fetchFromGitHub {
      owner = "luizalbertocviana";
      repo = "fuzzy-scripts";
      rev = "718cf7bda81b2cf45d8b9c1db51261ba0ce0da1f";
      sha256 = "Gj/n3vCE9R094cHA2hGWpHxm1ZTUCTUQCfUEstixvjo=";
    })
  ) {};
in

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
    pkgs.fira-code # the font I use in emacs
    pkgs.google-chrome
    pkgs.maestral # dropbox client
    pkgs.megasync
    pkgs.rnix-lsp # language server for nix language
    pkgs.unzip
    pkgs.zathura
    pkgs.libreoffice
    pkgs.leiningen # clojure project management
    pkgs.clojure-lsp
    pkgs.docker-compose
    pkgs.gcc
    pkgs.clang-tools
    pkgs.python3
    pkgs.python-language-server
    pkgs.dbeaver
    pkgs.ripgrep
    nethack4
    fuzzyScripts
  ];

  # environment variables
  home.sessionVariables = {
    NIX_PATH = "/home/luiz/.nix-defexpr/channels:/nix/var/nix/profiles/per-user/root/channels:nixpkgs=/nix/var/nix/profiles/per-user/root/channels/nixos:nixos-config=/etc/nixos/configuration.nix:/nix/var/nix/profiles/per-user/root/channels";
    XDG_DATA_DIRS = "/var/lib/flatpak/exports/share:/home/luiz/.local/share/flatpak/exports/share:$XDG_DATA_DIRS";
  };

  home.file = {
    ".emacs.d" = {
      source = pkgs.fetchFromGitHub {
        owner = "luizalbertocviana";
        repo = "emacs.d";
        rev = "91d6e1d42fdb22c0c5b80fff99d1abfef93d4fa0";
        sha256 = "iNArSxorW0japxwQC9mjfG9mgWatG4vJmq4qILpQYUg=";
      };
      recursive = true;
    };
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # emacs
  programs.emacs.enable = true;

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
    bashrcExtra = ". $HOME/.profile";
  };
}
