# Home Manager with Nix
This is simple nix flake (update 07/2023)

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

##### Linux Single User

```console
sh <(curl -L https://nixos.org/nix/install) --daemon
```

##### Linux Multi User

```console
sh <(curl -L https://nixos.org/nix/install) --no-daemon
```


#### Enable `experimental-features`

In general installation of nix, the nix configuration is located in `~/.config/nix/nix.conf`.
You **MUST** be set the `experimental-features` before use [this configuration](https://github.com/kemalmao19/flake).

```cfg
mkdir -p ~/.config/nix

echo "experimental-features = nix-command flakes" >> ~/.config/nix/nix.conf
```

### Setup

- Clone [this repository](https://github.com/kemalmao19/flake)

```console
// with SSH

git clone git@github.com:kemalmao19/flake

// OR with HTTP
git clone https://github.com/kemalmao19/flake

```

- Change directory to `flake`

```console
cd flake
```

- Run Build  
  command for build: `nix build .#homeConfigurations.[NAME].activationPackage`  
  Available for `[NAME]`:
  - `kemalmao`

```console
nix build .#homeConfigurations.kemalmao.activationPackage
```

- Apply from `Result`  
  command for apply the result: `./result/activation`  
  Available for `[NAME]`:
  - `kemalmao`  
    After `Run Build` you can apply from `./result/activation` with this command

```console
./result/activation
```

- Done 


