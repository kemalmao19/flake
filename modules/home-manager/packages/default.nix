{ pkgs, ... }: {
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    # fonts 
    nerd-fonts.fira-code
    nerd-fonts.fira-mono
    nerd-fonts.caskaydia-mono
    nerd-fonts.caskaydia-cove
    nerd-fonts.jetbrains-mono
    corefonts
    vista-fonts

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

    # pdf & tex
    zathura

    #multiplexer
    zellij

    ##formatter 
    nixfmt-classic
    stylua
    biome
    black

    #lsp
    nixd

    #node
    nodejs_20
    # pnpm
    vscode-langservers-extracted
    # nodePackages."typescript"
    # nodePackages."typescript-language-server"
    # nodePackages."@rescript/language-server"

    # download manager
    gabutdm

    # academic
    google-chrome
    zotero

    # productiviy
    gnome-solanum
    blanket

    # noteTaking 
    notesnook

  ];

  imports = [

    # ./alacritty
    ./yazi.nix
    ./fish.nix
    ./tmux.nix
    ./fzf.nix
    ./zoxide.nix
    ./git.nix

    ./starship

    ## neovim 
    # ./neovim
    ../../nixvim

    ./vscode
    # ./helix.nix
    # ./zsh.nix

    ## caelestia 
    ./caelestia
  ];

}
