{ config, pkgs, ... }:

{
  programs.fish = {
    enable = true;
    shellAbbrs = {
      cp = "cp -iv";
      mv = "mv -iv";
      rm = "trash-put";
      cat = "bat";
      less = "less -i";
      gst = "git status";
      gco = "git checkout";
      gcm = "git commit -m";
      gai = "git add -i";
      gpull = "git pull";
      gpush = "git push";
    };
  };

  programs.tmux = {
    enable = true;
    # mouse = true;
    shortcut = "a";
    aggressiveResize = true;
    baseIndex = 1;
    newSession = true;
    escapeTime = 0;
    clock24 = false;
    terminal = "screen-256color";
    sensibleOnTop = true;
    plugins = with pkgs.tmuxPlugins; [
      # sensible
      pain-control
      yank
      prefix-highlight
      better-mouse-mode
    ];
  };

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    withPython3 = true;
    plugins = with pkgs.vimPlugins; [
      # neovim-sensible
      # nvim-surround
      # nvim-treesitter
      nvim-cmp
      

      vim-airline
      {
          plugin = vim-airline-themes;
          config = ''
            let g:airline_themes='wombat'
          '';
      }
      
      # vim-airline-clock
      # vim-commentary
      # vim-fugitive
      # vim-gitgutter
      # vim-indent-guides

      {
        plugin = dracula-vim;
        config = ''
          syntax enable
          colorscheme dracula
        '';
      }
    ];
    extraConfig = ''
      set cursorline
      set scrolloff=5
    '';
  };
}

