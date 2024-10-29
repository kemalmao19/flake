{ pkgs, ... }: {
  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "FiraCode" "Meslo" "Hack" ]; })
    trash-cli
    ranger
    neofetch
    bottom
    bat
    ripgrep
    fd
    eza
    xclip

    joplin-desktop

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

    ./packages/starship
    ./packages/starship/starship-symbol.nix
    ./packages/fish.nix
    ./packages/tmux.nix
    ./packages/fzf.nix
    ./packages/zoxide.nix
    ./packages/git.nix
    # ./packages/neovim

    #./packages/vscode
    # ./packages/helix.nix
    # ./packages/zsh.nix
    # ./packages/alacritty.nix
  ];
  # dotfiles
  home.file.".inputrc".source = ./dotfiles/inputrc;
  home.file.".config/kitty/".source = ./dotfiles/config/kitty;
  home.file.".config/neofetch/".source = ./dotfiles/config/neofetch;
}
