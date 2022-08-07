{
  config,
  pkgs,
  ...
} @ opts:

let
  baseHomeConfig = (import ./base-home-config.nix) opts;

  applyExtraSetups = extraSetups:
    builtins.foldl'
      (config: extraSetup: extraSetup config)
      baseHomeConfig
      extraSetups;

  emacsSetup = import ./emacs.nix pkgs;
  nethack4Setup = import ./nethack4.nix pkgs;
  fuzzyScriptsSetup = import ./fuzzy-scripts.nix pkgs;
in
  applyExtraSetups [
    emacsSetup
    nethack4Setup
    fuzzyScriptsSetup
  ]
