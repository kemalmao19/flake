{ pkgs, ... }: {
  imports = [
    ./ui
    ./lsp
    ./whichkey.nix
    ./hover.nix
    ./comment.nix
    ./codeium.nix
    ./autopairs.nix
    ./neoscroll.nix
  ];

  extraPlugins = with pkgs.vimPlugins; [
    vim-bbye

    vim-fugitive
    vim-rhubarb
    vim-prisma
    vim-surround
    emmet-vim
    vim-gitgutter

    telescope-fzf-native-nvim
    telescope-ui-select-nvim
    plenary-nvim
  ];
}
