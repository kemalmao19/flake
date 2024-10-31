{
  plugins.comment = {
    enable = true;
    luaConfig = {
      pre = ''
        local opts = { noremap = true, silent = true }
        vim.keymap.set('n', '<C-c>', require('Comment.api').toggle.linewise.current, opts)
        vim.keymap.set('v', '<C-c>', "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>", opts)
      '';
    };
  };
}
