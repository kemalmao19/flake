{plugins.lualine = {
    enable = true;
    settings = {
        options = {
    icons_enabled = true;
    theme = "catppuccin"; 
    # https://www.nerdfonts.com/cheat-sheet
    #        
    section_separators = { left = ""; right = ""; };
    component_separators = { left = ""; right = ""; };
    disabled_filetypes = [ "alpha" "neo-tree" ];
    always_divide_middle = true;
};
sections = {
    lualine_a = [ "mode" ];
    lualine_b = [ "branch" ];
    lualine_c = [ "filename" ];
    lualine_x = [ "diagnostics" "diff"  ];
    lualine_y = [ "location" ];
    lualine_z = [ "progress" ];
};
inactive_sections = {
    lualine_a = [];
    lualine_b = [];
    lualine_c = [ { __raw = "filename"; path = 1; } ];
    lualine_x = [ { __raw = "location"; padding = 0; } ];
    lualine_y = [];
    lualine_z = [];
};
tabline = {};


};
    };}
