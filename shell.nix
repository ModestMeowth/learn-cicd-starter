{pkgs, ...}:
pkgs.mkShell {
  packages = with pkgs; [
    just
  ];

  buildInputs = with pkgs; [
    go
    gopls
    gofumpt
  ];
}
