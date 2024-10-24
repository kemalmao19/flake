{ pkgs, ... }:
let
  packaged = with pkgs.vimPlugins;
    let
      vim-rescript = pkgs.vimUtils.buildVimPlugin {
        name = "vim-rescript";
        src = pkgs.fetchFromGitHub {
          owner = "rescript-lang";
          repo = "vim-rescript";
          rev = "aea5715";
          hash = "sha256-l12sg9O5elqWTFRs9asa9xMnKw5GbV7ZB8HmtjcFVps=";
        };
      };
    in [
      vim-rescript
      vim-nix
      vim-tmux-navigator

      # bufferline dep
      vim-bbye
      nvim-web-devicons

      #misc
      vim-sleuth
      vim-fugitive
      vim-rhubarb
      which-key-nvim
      todo-comments-nvim
      vim-prisma

      # cmp-nvim dep
      cmp-nvim-lsp
      cmp-buffer
      cmp-path
      cmp-cmdline
      cmp_luasnip
      luasnip

      # telescope dependency
      telescope-fzf-native-nvim
      telescope-ui-select-nvim
      plenary-nvim

      # none ls
      null-ls-nvim
    ];

  customPackages = with pkgs.vimPlugins;
    let
      openFile = path: "${builtins.readFile path}";
      lua = name: conf: {
        plugin = name;
        type = "lua";
        config =
          if builtins.typeOf conf == "string" then conf else openFile conf;
      };
    in [
      (lua catppuccin-nvim ./config/plugins/theme/catppuccin-nvim.lua)

      (lua neoscroll-nvim ./config/plugins/smooth-scroll.lua)

      (lua gitsigns-nvim ./config/plugins/gitsigns.lua)

      (lua indent-blankline-nvim ./config/plugins/indent-blank.lua)

      (lua nvim-autopairs ./config/plugins/autopair.lua)

      (lua nvim-tree-lua ./config/plugins/nvim-tree.lua)

      (lua lualine-nvim ./config/plugins/lualine.lua)

      (lua comment-nvim ./config/plugins/comment.lua)

      (lua bufferline-nvim ./config/plugins/bufferline.lua)

      (lua (nvim-treesitter.withPlugins (p: [
        p.tree-sitter-nix
        p.tree-sitter-typescript
        p.tree-sitter-javascript
        p.tree-sitter-vim
        p.tree-sitter-bash
        p.tree-sitter-lua
        p.tree-sitter-python
        p.tree-sitter-json
        p.tree-sitter-rescript
        p.tree-sitter-prisma
      ])) ./config/plugins/treesitter.lua)

      (lua telescope-nvim ./config/plugins/telescope.lua)

      (lua alpha-nvim ./config/plugins/alpha.lua)

      (lua lazy-lsp-nvim ./config/plugins/lazy-lsp.lua)
      #      (lua nvim-lspconfig ./config/plugins/lsp.lua)
      (lua hover-nvim ./config/plugins/hover.lua)

      (lua nvim-cmp ./config/plugins/autocomplete.lua)

      (lua none-ls-nvim ./config/plugins/none-ls.lua)

      (lua codeium-nvim ./config/plugins/codeium.lua)

      (lua friendly-snippets ''
        require('luasnip.loaders.from_vscode').lazy_load()
      '')

      (lua nvim-colorizer-lua ''require("colorizer").setup()'')

      (lua neogit ''
        local neogit = require('neogit')
        neogit.setup {}'')
    ];
in packaged ++ customPackages
