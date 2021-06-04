{
  description = "{{cookiecutter.project_name}} flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/6933d068c5d2fcff398e802f7c4e271bbdab6705";
    flake-utils.url = "github:numtide/flake-utils/2ebf2558e5bf978c7fb8ea927dfaed8fefab2e28";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        hlib = pkgs.haskell.lib;
        packageName = "{{cookiecutter.project_name}}";

        source = pkgs.nix-gitignore.gitignoreSource [ ] ./.;
        package = my-haskell-packages.callCabal2nix packageName source { };

        my-haskell-packages = pkgs.haskellPackages.override {
          overrides = hself: hsuper:
            let from-hackage = x: hlib.doJailbreak (hlib.dontCheck (hlib.dontHaddock (hsuper.callHackageDirect x { })));
            in {
              {{cookiecutter.project_name}} = package;
            };
        };

      in {
        defaultPackage = self.packages.${system}.${packageName};

        packages.${packageName} = hlib.justStaticExecutables package;

        devShell = my-haskell-packages.shellFor {
          packages = p: [ p.${packageName} ];

          buildInputs = with my-haskell-packages; [
            cabal-install
            ghcid
            hlint
          ];

          inputsFrom = builtins.attrValues self.packages.${system};
          withHoogle = false;
        };

      });
}
