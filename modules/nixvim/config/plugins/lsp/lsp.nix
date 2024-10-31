{ pkgs, ... }: {
  # https://nix-community.github.io/nixvim/plugins/fidget/index.html
  plugins.fidget = { enable = true; };

  extraPlugins = with pkgs.vimPlugins; [ luvit-meta ];

  # https://nix-community.github.io/nixvim/NeovimOptions/autoGroups/index.html
  autoGroups = { "kickstart-lsp-attach" = { clear = true; }; };

  plugins.lsp = {
    enable = true;
    servers = {
      ts_ls.enable = true;
      nixd.enable = true;
    };
    keymaps = {
      # Diagnostic keymaps
      diagnostic = {
        "<leader>q" = {
          #mode = "n";
          action = "setloclist";
          desc = "Open diagnostic [Q]uickfix list";
        };
      };
      extra = [
        # Jump to the definition of the word under your cusor.
        #  This is where a variable was first declared, or where a function is defined, etc.
        #  To jump back, press <C-t>.
        {
          mode = "n";
          key = "gd";
          action.__raw = "require('telescope.builtin').lsp_definitions";
          options = { desc = "LSP: [G]oto [D]efinition"; };
        }
        # Find references for the word under your cursor.
        {
          mode = "n";
          key = "gr";
          action.__raw = "require('telescope.builtin').lsp_references";
          options = { desc = "LSP: [G]oto [R]eferences"; };
        }
        # Jump to the implementation of the word under your cursor.
        #  Useful when your language has ways of declaring types without an actual implementation.
        {
          mode = "n";
          key = "gI";
          action.__raw = "require('telescope.builtin').lsp_implementations";
          options = { desc = "LSP: [G]oto [I]mplementation"; };
        }
        # Jump to the type of the word under your cursor.
        #  Useful when you're not sure what type a variable is and you want to see
        #  the definition of its *type*, not where it was *defined*.
        {
          mode = "n";
          key = "<leader>D";
          action.__raw = "require('telescope.builtin').lsp_type_definitions";
          options = { desc = "LSP: Type [D]efinition"; };
        }
        # Fuzzy find all the symbols in your current document.
        #  Symbols are things like variables, functions, types, etc.
        {
          mode = "n";
          key = "<leader>ds";
          action.__raw = "require('telescope.builtin').lsp_document_symbols";
          options = { desc = "LSP: [D]ocument [S]ymbols"; };
        }
        # Fuzzy find all the symbols in your current workspace.
        #  Similar to document symbols, except searches over your entire project.
        {
          mode = "n";
          key = "<leader>ws";
          action.__raw =
            "require('telescope.builtin').lsp_dynamic_workspace_symbols";
          options = { desc = "LSP: [W]orkspace [S]ymbols"; };
        }
      ];
      lspBuf = {
        # Rename the variable under your cursor.
        #  Most Language Servers support renaming across files, etc.
        "<leader>rn" = {
          action = "rename";
          desc = "LSP: [R]e[n]ame";
        };
        # Execute a code action, usually your cursor needs to be on top of an error
        # or a suggestion from your LSP for this to activate.
        "<leader>ca" = {
          #mode = "n";
          action = "code_action";
          desc = "LSP: [C]ode [A]ction";
        };
        # WARN: This is not Goto Definition, this is Goto Declaration.
        #  For example, in C this would take you to the header.
        "gD" = {
          action = "declaration";
          desc = "LSP: [G]oto [D]eclaration";
        };
      };
    };
    onAttach = ''
      -- NOTE: Remember that Lua is a real programming language, and as such it is possible
      -- to define small helper and utility functions so you don't have to repeat yourself.
      --
      -- In this case, we create a function that lets us more easily define mappings specific
      -- for LSP related items. It sets the mode, buffer and description for us each time.
      local map = function(keys, func, desc)
        vim.keymap.set('n', keys, func, { buffer = bufnr, desc = 'LSP: ' .. desc })
      end

      -- The following two autocommands are used to highlight references of the
      -- word under the cursor when your cursor rests there for a little while.
      --    See `:help CursorHold` for information about when this is executed
      --
      -- When you move your cursor, the highlights will be cleared (the second autocommand).
      if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
        local highlight_augroup = vim.api.nvim_create_augroup('kickstart-lsp-highlight', { clear = false })
        vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
          buffer = bufnr,
          group = highlight_augroup,
          callback = vim.lsp.buf.document_highlight,
        })

        vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
          buffer = bufnr,
          group = highlight_augroup,
          callback = vim.lsp.buf.clear_references,
        })

        vim.api.nvim_create_autocmd('LspDetach', {
          group = vim.api.nvim_create_augroup('kickstart-lsp-detach', { clear = true }),
          callback = function(event2)
            vim.lsp.buf.clear_references()
            vim.api.nvim_clear_autocmds { group = 'kickstart-lsp-highlight', buffer = event2.buf }
          end,
        })
      end

      -- The following autocommand is used to enable inlay hints in your
      -- code, if the language server you are using supports them
      --
      -- This may be unwanted, since they displace some of your code
      if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
        map('<leader>th', function()
          vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf })
        end, '[T]oggle Inlay [H]ints')
      end
    '';
  };
}
