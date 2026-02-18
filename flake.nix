{
  inputs = {
    nixpkgs.url = "nixpkgs";
    flake-parts.url = "flake-parts";
  };

  outputs =
    {flake-parts, nixpkgs, ...}@inputs:
    flake-parts.lib.mkFlake { inherit inputs; }
    {
      systems = nixpkgs.lib.systems.flakeExposed;
      perSystem =
        {inputs', pkgs, ...}:
        {
          devShells.default = import ./shell.nix { inherit inputs' pkgs; };
        };
    };
}
