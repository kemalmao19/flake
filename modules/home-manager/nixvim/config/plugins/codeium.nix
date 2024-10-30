{
  plugins.codeium-nvim = {
    enable = true;
    settings = { enable_chat = true; };
    luaConfig = {
      pre = ''
        require("codeium").setup({})

        vim.keymap.set('i', '<C-g>', function() return vim.fn['codeium#Accept']() end, { expr = true, silent = true })
        vim.keymap.set('i', '<c-;>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true, silent = true })
        vim.keymap.set('i', '<c-,>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true, silent = true })
        vim.keymap.set('i', '<c-x>', function() return vim.fn['codeium#Clear']() end, { expr = true, silent = true })
        -- Change '<C-g>' here to any keycode you like.
      '';
    };
  };
}
