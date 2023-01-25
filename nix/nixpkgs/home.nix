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
  enhancedCommandsSetup = import ./enhanced-commands.nix pkgs;
  clojureSetup = import ./clojure.nix pkgs;
  scalaSetup = import ./scala.nix pkgs;
  javaSetup = import ./java.nix pkgs;
  cppSetup = import ./cpp.nix pkgs;
  pythonSetup = import ./python.nix pkgs;
  direnvSetup = import ./direnv.nix pkgs;
  tmuxSetup = import ./tmux.nix pkgs;
in
  applyExtraSetups [
    emacsSetup
    nethack4Setup
    fuzzyScriptsSetup
    enhancedCommandsSetup
    clojureSetup
    scalaSetup
    javaSetup
    cppSetup
    pythonSetup
    direnvSetup
    tmuxSetup
  ]
