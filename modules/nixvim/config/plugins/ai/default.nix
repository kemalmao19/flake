{ pkgs, ... }: {
  extraPlugins = with pkgs.vimPlugins; [ supermaven-nvim ];
  plugins.cmp.settings.sources = [{ name = "supermaven"; }];

  extraConfigLuaPost = ''
    -- supermaven
    require("supermaven-nvim").setup({
      disable_keymaps = true
    })
  '';

}
