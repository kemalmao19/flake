{ pkgs, ... }:
let
  packaged = let
    vim-rescript = pkgs.vimUtils.buildVimPlugin {
      name = "vim-rescript";
      src = pkgs.fetchFromGitHub {
        owner = "rescript-lang";
        repo = "vim-rescript";
        rev = "aea5715";
        hash = "sha256-l12sg9O5elqWTFRs9asa9xMnKw5GbV7ZB8HmtjcFVps=";
      };
    };
  in with pkgs.vimPlugins; [
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
    vim-surround
    emmet-vim
    vim-gitgutter
    vim-multiple-cursors

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

  customPackages = let
    lua = name: conf: {
      plugin = name;
      type = "lua";
      config = if builtins.isString conf then conf else builtins.readFile conf;
    };

  in with pkgs.vimPlugins; [
    (lua catppuccin-nvim ./config/plugins/theme/catppuccin-nvim.lua)

    (lua neoscroll-nvim ./config/plugins/neoscroll-nvim.lua)

    (lua gitsigns-nvim ./config/plugins/gitsigns-nvim.lua)

    (lua indent-blankline-nvim ./config/plugins/indent-blankline-nvim.lua)

    (lua nvim-autopairs ./config/plugins/nvim-autopairs.lua)

    (lua nvim-tree-lua ./config/plugins/nvim-tree-lua.lua)

    (lua lualine-nvim ./config/plugins/lualine-nvim.lua)

    (lua comment-nvim ./config/plugins/comment-nvim.lua)

    (lua bufferline-nvim ./config/plugins/bufferline-nvim.lua)

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
    ])) ./config/plugins/nvim-treesitter.lua)

    (lua telescope-nvim ./config/plugins/telescope-nvim.lua)

    (lua alpha-nvim ./config/plugins/alpha-nvim.lua)

    (lua lazy-lsp-nvim ./config/plugins/lazy-lsp-nvim.lua)
    # (lua nvim-lspconfig)
    (lua hover-nvim ./config/plugins/hover-nvim.lua)

    (lua nvim-cmp ./config/plugins/nvim-cmp.lua)

    (lua none-ls-nvim ./config/plugins/none-ls-nvim.lua)

    (lua codeium-nvim ./config/plugins/codeium-nvim.lua)

    (lua friendly-snippets ''
      require('luasnip.loaders.from_vscode').lazy_load()
    '')

    (lua nvim-colorizer-lua ''require("colorizer").setup()'')

    (lua neogit ''
      local neogit = require('neogit')
      neogit.setup {}'')
  ];
in packaged ++ customPackages
