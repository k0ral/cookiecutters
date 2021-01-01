let nixpkgs = import <nixpkgs> {};
in nixpkgs.haskellPackages.callPackage ./default.nix {}

