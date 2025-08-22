{ pkgs, ... }: {
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    nerd-fonts.fira-code
    nerd-fonts.fira-mono
    nerd-fonts.caskaydia-mono
    nerd-fonts.caskaydia-cove
    nerd-fonts.jetbrains-mono
    trash-cli
    ranger
    ueberzugpp
    fastfetch
    imagemagick
    w3m
    bottom
    bat
    ripgrep
    fd
    eza
    # xclip
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

    # ./packages/alacritty
    ./packages/starship
    ./packages/fish.nix
    ./packages/tmux.nix
    ./packages/fzf.nix
    ./packages/zoxide.nix
    ./packages/git.nix

    ## neovim 
    # ./packages/neovim
    ../nixvim

    ./packages/vscode
    # ./packages/helix.nix
    # ./packages/zsh.nix
    # ./packages/texlive.nix

    ## caelestia 
    ./packages/caelestia
  ];

}
