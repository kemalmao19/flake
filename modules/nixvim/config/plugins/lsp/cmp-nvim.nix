{ pkgs, ... }: {
  plugins.cmp = {
    enable = true;

    luaConfig.pre = ''
      -- nvim-cmp setup
      local cmp = require("cmp")
      local luasnip = require("luasnip")
      luasnip.config.setup({})

      -- Icons for completion menu
      local kind_icons = {
        Text          = "",
        Method        = "",
        Function      = "󰊕",
        Constructor   = "",
        Field         = "",
        Variable      = "󰀫",
        Class         = "",
        Interface     = "",
        Module        = "",
        Property      = "",
        Unit          = "",
        Value         = "󰎠",
        Enum          = "",
        Keyword       = "󰌋",
        Snippet       = "",
        Color         = "󰏘",
        File          = "󰈙",
        Reference     = "",
        Folder        = "󰉋",
        EnumMember    = "",
        Constant      = "󰇽",
        Struct        = "",
        Event         = "",
        Operator      = "󰆕",
        TypeParameter = "󰊄",
        Codeium       = "",
      }

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        completion = { completeopt = "menu,menuone,noinsert" },

        mapping = cmp.mapping.preset.insert({
          ["<C-n>"] = cmp.mapping.select_next_item(),
          ["<C-p>"] = cmp.mapping.select_prev_item(),
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-y>"] = cmp.mapping.confirm({ select = true }),
          ["<C-Space>"] = cmp.mapping.complete({}),

          ["<C-l>"] = cmp.mapping(function()
            if luasnip.expand_or_locally_jumpable() then
              luasnip.expand_or_jump()
            end
          end, { "i", "s" }),

          ["<C-h>"] = cmp.mapping(function()
            if luasnip.locally_jumpable(-1) then
              luasnip.jump(-1)
            end
          end, { "i", "s" }),

          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_locally_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { "i", "s" }),

          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.locally_jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
        }),

        sources = {
          { name = "lazydev", group_index = 0 }, -- Avoid duplicate Lua completions
          { name = "supermaven", group_index = 1 },
          { name = "nvim_lsp",   group_index = 2 },
          { name = "luasnip",    group_index = 2 },
          { name = "buffer",     group_index = 2 },
          { name = "path",       group_index = 2 },
        },

        formatting = {
          fields = { "kind", "abbr", "menu" },
          format = function(entry, vim_item)
            vim_item.kind = kind_icons[vim_item.kind] or vim_item.kind
            vim_item.menu = ({
              nvim_lsp = "[LSP]",
              luasnip  = "[Snippet]",
              buffer   = "[Buffer]",
              path     = "[Path]",
              supermaven = "[SuperMaven]",
            })[entry.source.name] or ""
            return vim_item
          end,
        },
      })
    '';
  };

  extraPlugins = with pkgs.vimPlugins; [
    cmp-nvim-lsp
    cmp-buffer
    cmp-path
    cmp_luasnip
    luasnip
    # cmp-cmdline  # <- Remove unless you configure cmdline completion
  ];
}

