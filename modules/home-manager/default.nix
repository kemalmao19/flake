{ pkgs, ... }: {
  # Don't change this when you change package input. Leave it alone.
  home.stateVersion = "23.05";
  home.sessionVariables = {
    PAGER = "less";
    CLICLOLOR = 1;
    EDITOR = "nvim";
  };

  nixpkgs.overlays = [ ../../overlays/default.nix ];

  # specify my home-manager configs
  # App bundle
  home.packages = with pkgs; [
    trash-cli
    ranger
    neofetch
    bottom
    bat
    ripgrep
    fd
    eza

    ##formatter 
    nixfmt-classic
    stylua
    biome
    # codespell
    black
    # prettierd
    # checkmake

    #lsp
    nixd

    #node
    nodejs_20
    nodePackages."typescript"
    nodePackages."typescript-language-server"
    # nodePackages."@rescript/language-server"

  ];

  imports = [
    ./packages/vscode
    ./packages/starship
    ./packages/starship/starship-symbol.nix
    # ./packages/helix.nix
    # ./packages/zsh.nix
    # ./packages/alacritty.nix
    ./packages/fish.nix
    ./packages/tmux.nix
    ./packages/fzf.nix
    ./packages/zoxide.nix
    ./packages/git.nix
    ./packages/neovim
  ];
  # dotfiles
  home.file.".inputrc".source = ./dotfiles/inputrc;
}
