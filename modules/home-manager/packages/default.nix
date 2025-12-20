{ pkgs, ... }: {
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    # fonts 
    # nerd-fonts.fira-code
    # nerd-fonts.fira-mono
    nerd-fonts.caskaydia-mono
    nerd-fonts.caskaydia-cove
    # nerd-fonts.jetbrains-mono
    # nerd-fonts.iosevka
    font-awesome
    # corefonts
    # vista-fonts

    #cli
    trash-cli
    ueberzugpp
    fastfetch
    imagemagick
    w3m
    bottom
    bat
    ripgrep
    fd
    eza
    xclip
    tree
    cava
    stow
    neovim
    zip
    unzip
    gcc
    gnumake

    # terminal 
    alacritty

    #multiplexer
    # zellij

    ##formatter 
    nixfmt-classic
    stylua
    # biome
    # black

    #lsp
    nixd

    #node
    # nodejs_20
    # pnpm
    # vscode-langservers-extracted
    # nodePackages."typescript"
    # nodePackages."typescript-language-server"
    # nodePackages."@rescript/language-server"

    # productiviy
    # gnome-solanum
    # blanket
    calcure

    # noteTaking 
    # notesnook
  ];

  imports = [

    # ./alacritty
    ./yazi.nix
    #./fish.nix
    ./tmux.nix
    ./fzf.nix
    ./zoxide.nix
    ./git.nix

    ./starship

    ## neovim 
    # ./neovim
    # ../../nixvim

    # ./vscode
    # ./helix.nix
    # ./zsh.nix

    ## caelestia 
    # ./caelestia

    # ./latex.nix
  ];

}
