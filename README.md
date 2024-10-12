# MacOS Home Manager with Nix

This is simple nix flake for darwin

# Why Nix

Nix flake provides subcommands for creating, modifying and querying Nix flakes. Flakes are the unit for packaging Nix code in a reproducible and discoverable way. They can have dependencies on other flakes, making it possible to have multi-repository Nix projects.

A flake is a filesystem tree (typically fetched from a Git repository or a tarball) that contains a file named flake.nix in the root directory. flake.nix specifies some metadata about the flake such as dependencies (called inputs), as well as its outputs (the Nix values such as packages or NixOS modules provided by the flake).

# Home Manager

![Alt text](https://github.com/kemalmao19/flake/blob/main/gallery/nix.png)

Nix Home Manager is a component of the Nix package manager ecosystem. Nix is a powerful package manager for Unix-like operating systems that provides a purely functional and declarative approach to package management. It allows users to define and manage software packages and configurations in a reproducible manner.

Nix Home Manager, specifically, is a tool that extends Nix to manage the configuration of user-specific packages and settings on a per-user basis. It allows users to define and manage their personal environment, including things like shell configurations, text editor settings, window manager configurations, and other user-specific software packages, all within a user's home directory.

With Nix Home Manager, you can version control your home directory configuration, making it easy to share your settings across different machines and ensuring consistency in your personal environment. It enables you to keep your user-specific configurations isolated from the system-wide configurations managed by the Nix package manager, thus providing a clean separation between system-level and user-level configurations.

By using Nix Home Manager in combination with the Nix package manager, you can create reproducible and portable development environments across different machines, making it a popular choice among developers who value the benefits of functional programming and declarative package management.

# How to use my flake

### Prerequisite

##### Nix Package Manager

Easy install with determinate systems:

```console
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
```

### Setup

- Clone [this repository](https://github.com/kemalmao19/flake-darwin)

```console
// with SSH

git clone git@github.com:kemalmao19/flake-darwin

// OR with HTTP
git clone https://github.com/kemalmao19/flake-darwin

```

- Change directory to `flake-darwin`

```console
cd flake-darwin
```

- Run Build  
  command for build: `nix build .#darwinConfigurations.[NAME].system`  
  Available for `[NAME]`:
  - `kemalmao`

```console
nix build .#darwinConfigurations.kemalmao.system
```

- Apply Build result
  command for apply the result: `darwin-rebuild switch --flake  .#[NAME]`  
  Available for `[NAME]`:
  - `kemalmao`  
    After `Run Build` you can apply from `darwin-rebuild switch --flake .#kemalmao` with this command

```console
darwin-rebuild switch --flake .#kemalmao
```

- Done
