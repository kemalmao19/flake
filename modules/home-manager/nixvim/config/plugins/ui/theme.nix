{
  colorschemes = {
    catppuccin = {
      enable = true;
      settings = {
        disable_underline = true;
        flavour = "frappe";
        integrations = {
          cmp = true;
          gitsigns = true;
          mini = {
            enabled = true;
            indentscope_color = "";
          };
          notify = false;
          nvimtree = true;
          treesitter = true;
        };
        styles = {
          booleans = [ "bold" "italic" ];
          conditionals = [ "bold" ];
          comments = [ "italic" ];
          functions = [ "italic" ];
          strings = [ "bold" ];
        };
        term_colors = true;
      };

    };
  };
}

