{
  plugins.bufferline = {
    enable = true;
    luaConfig.pre = ''
        require("catppuccin.groups.integrations.bufferline").get {
        styles = { "italic", "bold" },
      }
    '';
  };
}
