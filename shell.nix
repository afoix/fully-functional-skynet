let
  jupyter = import (builtins.fetchGit {
      url = https://github.com/tweag/jupyterWith;
      rev = "10d64ee254050de69d0dc51c9c39fdadf1398c38";
    }) {};

  ihaskell = jupyter.kernels.iHaskellWith {
    name = "haskell";
    packages = p: with p; [ hvega formatting ];
  };

  jupyterEnvironment = jupyter.jupyterlabWith {
    kernels = [ ihaskell ];
  };
in jupyterEnvironment.env
