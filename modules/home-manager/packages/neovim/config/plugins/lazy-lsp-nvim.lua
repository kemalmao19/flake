require('lazy-lsp').setup {
    -- By default all available servers are set up. Exclude unwanted or misbehaving servers.
    excluded_servers = {
        'ccls',                        -- prefer clangd
        'denols',                      -- prefer eslint and ts_ls
        'ruff',
        'docker_compose_language_service', -- yamlls should be enough?
        'flow',                        -- prefer eslint and ts_ls
        'ltex',                        -- grammar tool using too much CPU
        'quick_lint_js',               -- prefer eslint and ts_ls
        'scry',                        -- archived on Jun 1, 2023
        'tailwindcss',                 -- associates with too many filetypes
    },
    -- Alternatively specify preferred servers for a filetype (others will be ignored).
    preferred_servers = {
        markdown = {},
        typescript = { 'ts_ls', 'eslint' },
        python = { 'pyright' },
        rescript = { 'rescriptls' },
    },
    prefer_local = true, -- Prefer locally installed servers over nix-shell
    -- Default config passed to all servers to specify on_attach callback and other options.
    default_config = {
        flags = {
            debounce_text_changes = 150,
        },
        -- on_attach = on_attach,
        -- capabilities = capabilities,
    },
    -- Override config for specific servers that will passed down to lspconfig setup.
    -- Note that the default_config will be merged with this specific configuration so you don't need to specify everything twice.
    configs = {
        lua_ls = {
            settings = {
                Lua = {
                    diagnostics = {
                        -- Get the language server to recognize the `vim` global
                        globals = { 'vim' },
                    },
                },
            },
        },
    },
}
