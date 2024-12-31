# pyenv-nix-install

pyenv-nix-install is a [pyenv](https://github.com/pyenv/pyenv) plugin that
allows installing Python versions using [nix](https://nixos.org/nix/).

## Usage

```nix
{
  inputs = {
    nixpkgs-python.url = "github:cachix/nixpkgs-python";
    pyenv-nix-install.url = "github:sirno/pyenv-nix-install";
  };
}
```
