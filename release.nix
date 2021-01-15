{ compiler ? "ghc8102" }:

let
  pkgs = import <nixpkgs> { };
  unstable = import <unstable> { };

in
  rec {
    z3-haskell = pkgs.haskellPackages.callPackage ./z3.nix { z3 = pkgs.z3; };

    z3-shell = pkgs.haskell.packages.${compiler}.shellFor {
      packages = p: [ z3-haskell ];
      withIDe = true;
      buildInputs = [ pkgs.haskellPackages.hlint
                      pkgs.haskellPackages.stylish-haskell
                      pkgs.haskellPackages.hasktags
                      pkgs.haskellPackages.apply-refact
                      # pkgs.haskellPackages.hindent
                      pkgs.haskellPackages.ghcide
                      pkgs.haskellPackages.ghc-prof-flamegraph
                      pkgs.haskellPackages.profiteur
                      pkgs.zlib
                      pkgs.z3
                      pkgs.cabal-install
                      # unstable.julia
                    ];
    };
  }

# extraCmds = ''
# export LD_LIBRARY_PATH+=:${self.zlib}/lib
# '';
