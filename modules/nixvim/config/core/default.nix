{ pkgs, ... }: {
  imports = [ ./opts.nix ./keymaps.nix ];

  globals = {
    # Set <space> as the leader key
    # See `:help mapleader`
    mapleader = " ";
    maplocalleader = " ";

    # Set to true if you have a Nerd Font installed and selected in the terminal
    have_nerd_font = true;
  };

  # https://nix-community.github.io/nixvim/NeovimOptions/autoGroups/index.html
  autoGroups = { kickstart-highlight-yank = { clear = true; }; };

  # [[ Basic Autocommands ]]
  #  See `:help lua-guide-autocommands`
  # https://nix-community.github.io/nixvim/NeovimOptions/autoCmd/index.html
  autoCmd = [
    # Highlight when yanking (copying) text
    #  Try it with `yap` in normal mode
    #  See `:help vim.highlight.on_yank()`
    {
      event = [ "TextYankPost" ];
      desc = "Highlight when yanking (copying) text";
      group = "kickstart-highlight-yank";
      callback.__raw = ''
        function()
          vim.highlight.on_yank()
        end
      '';
    }
  ];

  plugins = {
    web-devicons.enable = true;

    # Detect tabstop and shiftwidth automatically
    sleuth = { enable = true; };

    # Highlight todo, notes, etc in comments
    todo-comments = {
      settings = {
        enable = true;
        signs = true;
      };
    };
  };

  # https://nix-community.github.io/nixvim/NeovimOptions/index.html?highlight=extraplugins#extraplugins
  extraPlugins = with pkgs.vimPlugins;
    [
      nvim-web-devicons # TODO: Figure out how to configure using this with telescope
    ];

  # TODO: Figure out where to move this
  # https://nix-community.github.io/nixvim/NeovimOptions/index.html?highlight=extraplugins#extraconfigluapre
  extraConfigLuaPre = ''
    if vim.g.have_nerd_font then
      require('nvim-web-devicons').setup {}
    end
  '';

  # The line beneath this is called `modeline`. See `:help modeline`
  # https://nix-community.github.io/nixvim/NeovimOptions/index.html?highlight=extraplugins#extraconfigluapost
  extraConfigLuaPost = ''
    -- vim: ts=2 sts=2 sw=2 et
  '';
}
