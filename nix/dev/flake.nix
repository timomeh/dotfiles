{
  description = "Dev Shells";
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  inputs.systems.url = "github:nix-systems/default";
  inputs.flake-utils.url = "github:numtide/flake-utils";
  inputs.flake-utils.inputs.systems.follows = "systems";

  # Different devShells to use with nix-direnv. Alternative to asdf, mise etc.
  # Makes different environment packages available in a project.
  #
  # Usage:
  # To use an environment, add an .envrc to the project dir with the contents:
  #   use flake ~/dotfiles/nix/dev#devShells.aarch64-darwin.node18
  #
  # You can also add multiple `use flake ...` lines to the .envrc.
  # Replace `aarch64-darwin` with your system architecture, and `node18`
  # with the devShell name.
  #
  # See all outputs of this flake:
  #   nix flake show ~/dotfiles/nix/dev
  #
  # To add a new environment, add a new `devShells.X` below.

  outputs =
    { nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        devShells.node18 = pkgs.mkShell {
          packages = [
            pkgs.nodejs_18
          ];
        };
      }
    );
}