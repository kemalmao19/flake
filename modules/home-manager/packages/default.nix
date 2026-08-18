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
    corefonts
    vista-fonts

    #cli
    trash-cli
    ueberzugpp
    fastfetch
    imagemagick
    w3m
    htop
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
    #gcc
    #gnumake
    fish

    ## terminal 
    # alacritty
    (pkgs.callPackage ./alacritty { })

    ## multiplexer
    # zellij

    ## formatter 
    nixfmt-classic
    stylua
    # biome
    # black

    ## lsp
    nixd

    ## productivity
    sent
    # discord
    todo
    # noteTaking 
    # obsidian

    ## graphics
    # gimp
    # inkscape

    ## office
    zotero
    wpsoffice-cn

    # dev 
    nodejs_22
  ];

  imports = [

    # ./alacritty
    ./yazi.nix
    #./fish.nix
    ./tmux.nix
    ./fzf.nix
    ./zoxide.nix
    ./git.nix

    ./polyglot

    ./starship
    ./xmonad.nix

    ## neovim 
    # ./neovim
    # ../../nixvim

    #./vscode
    # ./helix.nix
    # ./zsh.nix

    ## caelestia 
    # ./caelestia

    # ./latex.nix
  ];

}
