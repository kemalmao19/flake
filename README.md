# flake
This is simple nix flake (update 06/2023)

# Information
Nix flake provides subcommands for creating, modifying and querying Nix flakes. Flakes are the unit for packaging Nix code in a reproducible and discoverable way. They can have dependencies on other flakes, making it possible to have multi-repository Nix projects.

A flake is a filesystem tree (typically fetched from a Git repository or a tarball) that contains a file named flake.nix in the root directory. flake.nix specifies some metadata about the flake such as dependencies (called inputs), as well as its outputs (the Nix values such as packages or NixOS modules provided by the flake).

# How to use my flake

## With nix build command
### nix build .#homeConfigurations.<USER_IN_SET_ATTRIBUTES>.activationPackage
nix build .#homeConfigurations.kemal.activationPackage

## With home-manager command
### home-manager build .#<USER_IN_SET_ATTRIBUTES>
home-manager build .#kemal

## Switch With activate command from ./result
./result/activate

## With home-manager command
home-manager switch --flake .#kemal

