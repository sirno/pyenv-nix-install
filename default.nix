{ stdenv,
  fetchFromGitHub,

  # runtime dependencies
  pyenv,
}:
stdenv.mkDerivation rec {
  name = "pyenv-nix-install";
  version = "0.1.0";

  src = ./.;

  installPhase = ''
    runHook preInstall

    mkdir -p "$out/bin"
    cp -R bin $out
    chmod +x "$out/bin/pyenv-nix-install"

    runHook postInstall
  '';

}
