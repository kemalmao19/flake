# Nix Home Manager 
![Alt text](https://github.com/kemalmao19/flake/blob/main/gallery/nix.png)

## This is simple nix flake
### Nix Darwin
running nix package & home manager on darwin 

### Linux Home manager 
nix home manager for any kind linux distribution

### Nixos 
my NixOS configuration for old MacBook Pro


# How to use my flake

### Prerequisite

##### Nix Package Manager

Easy install with determinate systems:

```console
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
```

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

## Nix Darwin + Home manager

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

## Nix Linux Home Manager

- Run Build  
  command for build: `nix build .#homeConfigurations.[NAME].activationPackage`  
  Available for `[NAME]`:
  - `kemalmao`

```console
nix build .#homeConfigurations.kemalmao.activationPackage
```

- Apply Build result
  command for apply the result: `./result/activate`  
```console
./result/activate
```


- Done

## Nixos 
You can try 

```console
sudo nixos-rebuild switch --flake .#kemalmao
```
