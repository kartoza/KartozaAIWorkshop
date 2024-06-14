{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = [
    pkgs.python312
    pkgs.python312Packages.pip
    pkgs.zlib
    pkgs.python312Packages.mkdocs-material
    pkgs.python312Packages.lxml
  ];

  shellHook = ''
    echo "Setting up Python environment..."
    python3 -m venv .venv
    source .venv/bin/activate

    echo "Installing additional Python packages..."
    pip install mkdocs-material
  '';
}

