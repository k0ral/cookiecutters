{ nixpkgs ? import <nixpkgs> { } }:

let
  hlib = nixpkgs.haskell.lib;

  source = nixpkgs.nix-gitignore.gitignoreSource [ ] ./.;
  package = my-haskell-packages.callCabal2nix "{{cookiecutter.project_name}}" source { };

  my-haskell-packages = nixpkgs.haskellPackages.override {
    overrides = hself: hsuper:
      let
        fromHackage = x:
          hlib.dontCheck (hlib.dontHaddock (hsuper.callHackageDirect x { }));
      in {
        {{cookiecutter.project_name}} = package;
      };
  };

  shell = my-haskell-packages.shellFor {
    packages = p: [ p.{{cookiecutter.project_name}} ];

    buildInputs = with nixpkgs.haskellPackages; [
      cabal-install
      hlint
      ghcid
    ];

    withHoogle = false;
  };

in { inherit shell; }
