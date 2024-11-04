{ stdenv,
  fetchFromGitHub,

  # runtime dependencies
  pyenv,
}:
stdenv.mkDerivation rec {
  name = "pyenv-nix-install";
  version = "0.1.0";

  src = fetchFromGitHub {
    owner = "sirno";
    repo = "pyenv-nix-install";
    rev = "main";
    sha256 = "";
  }

  installPhase = ''
    mkdir -p $out/bin
    cp $src/pyenv-nix-install $out/bin
    chmod +x $out/bin/pyenv-nix-install
  '';

}
