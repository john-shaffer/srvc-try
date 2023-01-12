{
  description = "srvc-project";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    flake-compat = {
      url = "github:edolstra/flake-compat";
      flake = false;
    };
    flake-utils.url = "github:numtide/flake-utils";
    srvc.url = "github:insilica/rs-srvc";
  };
  outputs = { self, nixpkgs, flake-utils, srvc, ... }@inputs:
    flake-utils.lib.eachDefaultSystem (system:
      with import nixpkgs { inherit system; };
      let
        srvc-project = stdenv.mkDerivation {
          name = "srvc-project";
          src = ./.;

          installPhase = ''
            mkdir -p $out
          '';
        };
      in {
        packages = {
          inherit srvc-project;
          default = srvc-project;
        };
        devShells.default =
          mkShell { buildInputs = [ srvc.packages.${system}.default ]; };
      });
}
