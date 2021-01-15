{ mkDerivation, base, containers, hspec, QuickCheck, stdenv
, transformers, z3, deepseq
}:
mkDerivation {
  pname = "z3-haskell";
  version = "408.2";
  src = ./.;
  isLibrary = true;
  doCheck = false;
  isExecutable = true;
  libraryHaskellDepends = [ base containers transformers deepseq ];
  librarySystemDepends = [ z3 ];
  testSystemDepends = [ z3 ];
  testHaskellDepends = [ base hspec QuickCheck ];
  homepage = "https://github.com/IagoAbal/haskell-z3";
  description = "Bindings for the Z3 Theorem Prover";
  license = stdenv.lib.licenses.bsd3;
}
