FROM ghcr.io/xtruder/nix-devcontainer:v1
ADD . /workspaces/srvc-template/
RUN nix flake check /workspaces/srvc-template/
RUN nix-shell /workspaces/srvc-template/shell.nix --run "echo done building nix-shell derivation"
RUN nix develop /workspaces/srvc-template/ -c echo done building nix dev environment
