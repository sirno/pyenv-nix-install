{
  description = "pyenv plugin to manage python versions with nix";

  inputs.nixpkgs.url = "nixpkgs";

  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        pyenv = pkgs.pyenv;
        pyenv-nix-install = pkgs.callPackage ./default.nix {};
      in {
        devShell = pkgs.mkShell {
          buildInputs = [ pyenv pyenv-nix-install ];

          shellHook = ''
            export PYENV_ROOT=${pyenv}
            export PATH=$PYENV_ROOT/bin:$PATH
          '';
        };
      }
    );
}
