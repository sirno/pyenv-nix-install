{
  description = "pyenv plugin to manage python versions with nix";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";

    flake-utils.url = "github:numtide/flake-utils";

    nixpkgs-python.url = "github:cachix/nixpkgs-python";
  };

  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
      nixpkgs-python,
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        pyenv = pkgs.pyenv;
        pyenv-nix-install = pkgs.callPackage ./default.nix { };
      in
      {
        packages.default = pyenv-nix-install;

        devShells.default = pkgs.mkShell {
          buildInputs = [
            pyenv
            pyenv-nix-install
          ];

          shellHook = ''
            export PYENV_ROOT=${pyenv}
            export PATH=$PYENV_ROOT/bin:$PATH
          '';
        };
      }
    );
}
