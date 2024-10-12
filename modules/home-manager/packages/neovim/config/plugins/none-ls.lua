local null_ls = require 'null-ls'
local formatting = null_ls.builtins.formatting   -- to setup formatters
local diagnostics = null_ls.builtins.diagnostics -- to setup linters

local sources = {
  diagnostics.checkmake,
  formatting.biome.with {
    filetypes = {
      'javascript',
      'json',
      'typescript',
      'typescriptreact',
      'javascriptreact',
      'rescript',
      'html',
      'yaml',
      'markdown',
    },
  },
  formatting.stylua,
  formatting.nixfmt,
  formatting.black,
}

local augroup = vim.api.nvim_create_augroup('LspFormatting', {})
null_ls.setup {
  -- debug = true, -- Enable debug mode. Inspect logs with :NullLsLog.
  sources = sources,
  -- you can reuse a shared lspconfig on_attach callback here
  on_attach = function(client, bufnr)
    if client.supports_method 'textDocument/formatting' then
      vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
      vim.api.nvim_create_autocmd('BufWritePre', {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format { async = false }
        end,
      })
    end
  end,
}
