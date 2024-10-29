{ pkgs, ... }: {
  # https://nix-community.github.io/nixvim/plugins/fidget/index.html
  plugins.fidget = { enable = true; };

  extraPlugins = with pkgs.vimPlugins; [ luvit-meta ];

  # https://nix-community.github.io/nixvim/NeovimOptions/autoGroups/index.html
  autoGroups = { "kickstart-lsp-attach" = { clear = true; }; };

  plugins.lsp = {
    enable = true;
    servers = {
      ts_ls.enable = true;
      nixd.enable = true;
    };
  };
}
