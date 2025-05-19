{ pkgs, ... }: {
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    (nerdfonts.override {
      fonts = [ "FiraCode" "CascadiaCode" "JetBrainsMono" ];
    })
    trash-cli
    ranger
    ueberzugpp
    # neofetch
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
    latexrun
    # texliveBasic

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
    nodePackages."typescript"
    nodePackages."typescript-language-server"
    # nodePackages."@rescript/language-server"

    google-chrome
    zotero

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
    ./packages/neovim
    # ../nixvim

    ./packages/vscode
    # ./packages/helix.nix
    # ./packages/zsh.nix
    # ./packages/texlive.nix
  ];

}
