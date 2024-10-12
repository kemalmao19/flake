{ pkgs, ... }: {

  programs.neovim = {
    enable = true;
    withPython3 = true;
    withNodeJs = true;
    viAlias = true;
    vimAlias = true;
    plugins = import ./plugins.nix { inherit pkgs; };
    extraConfig = ''
      luafile ~/flake-darwin/modules/home-manager/packages/neovim/config/core/options.lua
      luafile ~/flake-darwin/modules/home-manager/packages/neovim/config/core/keymaps.lua
      luafile ~/flake-darwin/modules/home-manager/packages/neovim/config/core/snippet.lua
      luafile ~/flake-darwin/modules/home-manager/packages/neovim/config/core/misc.lua
    '';
  };
  # easy mode
  # xdg.configFile.nvim = {
  #   source = ./config;
  #   recursive = true;
  # };
}
