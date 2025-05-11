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
    neofetch
    fastfetch
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
    # codespell
    black
    # prettierd
    # checkmake

    #lsp
    nixd

    #node
    pnpm
    nodejs_20
    nodePackages."typescript"
    nodePackages."typescript-language-server"
    # nodePackages."@rescript/language-server"

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

    #./packages/vscode
    # ./packages/helix.nix
    # ./packages/zsh.nix
    ./packages/texlive.nix
  ];
  # dotfiles
  home.file.".inputrc".source = ./dotfiles/inputrc;
  home.file.".config/kitty/".source = ./dotfiles/config/kitty;
  home.file.".conJetBrainsMonofig/neofetch/".source =
    ./dotfiles/config/neofetch;
  home.file.".config/fastfetch/".source = ./dotfiles/config/fastfetch;
  home.file.".config/zellij/".source = ./dotfiles/config/zellij;

  # hyprland 
  home.file.".config/hypr/".source = ./dotfiles/config/hyprland/hypr;
  home.file.".config/waybar/".source = ./dotfiles/config/hyprland/waybar;
  home.file.".config/rofi/".source = ./dotfiles/config/hyprland/rofi;
  home.file.".icons/hypr-dots-peach/".source =
    ./dotfiles/config/cursor/hypr-dots-peach;
}
