{ pkgs, ... }: {
  imports = [ ./ui ./whichkey.nix ./lsp ];

  extraPlugins = with pkgs.vimPlugins; [
    vim-fugitive
    vim-rhubarb
    vim-prisma
    vim-surround
    emmet-vim
    vim-gitgutter
  ];
}
