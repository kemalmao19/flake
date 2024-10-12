local nvim_lsp = require 'lspconfig'
local on_attach = function(_, bufnr)
  local function buf_set_option(...)
    vim.api.nvim_buf_set_option(bufnr, ...)
  end

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { buffer = bufnr, noremap = true, silent = true }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, opts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
  vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
  vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
  vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
  vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)
end

-- Add the server that troubles you here
-- local ts_ls = 'ts_ls'
-- local cmd = { 'typescript-language-server', '--stdio' } -- needed for elixirls, lua_ls, omnisharp
-- if not name then
--   print 'You have not defined a server name, please edit minimal_init.lua'
-- end
-- if not nvim_lsp[name].document_config.default_config.cmd and not cmd then
--   print [[You have not defined a server default cmd for a server
--     that requires it please edit minimal_init.lua]]
-- end
--
nvim_lsp.ts_ls.setup {
  filetypes = { 'javascript', 'javascriptreact', 'javascript.jsx', 'typescript', 'typescriptreact', 'typescript.tsx' },
  on_attach = on_attach,
}
nvim_lsp.rescriptls.setup {
  filetypes = { 'rescript' },
  on_attach = on_attach,
}
nvim_lsp.pyright.setup {
  filetypes = { 'python' },
  on_attach = on_attach,
}
nvim_lsp.lua_ls.setup {
  filetypes = { 'lua' },
  on_attach = on_attach,
}
nvim_lsp.nixd.setup {
  filetypes = { 'nix' },
  on_attach = on_attach,
}
--
-- print [[You can find your log at $HOME/.cache/nvim/lsp.log. Please paste in a github issue under a details tag as described in the issue template.]]
