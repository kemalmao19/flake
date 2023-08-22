{ config, pkgs, lib, ... }:

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
      py = "python";
      startdb = "systemctl start mysql";
      stopdb = "systemctl stop mysql";
      statdb = "systemctl status mysql";
      nixpkg = "nix-env -iA nixpkgs";
      nixospkg = "nix-env -iA nixos";
      # vi = "hx";
      # ls = "exa";
      # top = "btm";
    };
  };

  programs.helix = {
    enable = true;
    settings = {
      theme = "tokyonight";
      editor = {
        line-number = "relative";
        lsp.display-messages = true;
      };
      keys.normal = {
        space.space = "file_picker";
        space.w = ":w";
        space.q = ":q";
        esc = [ "collapse_selection" "keep_primary_selection" ];
      };
    };
  };

  programs.tmux = {
    enable = true;
    mouse = true;
    plugins = with pkgs; [ 
      tmuxPlugins.catppuccin
      tmuxPlugins.power-theme
    ];
    
    extraConfig = ''

      set -g status off

      # COLORS
      bg_color='#282c34'

      # BORDERS COLOR
      set -g pane-border-style "fg=$bg_color bg=$bg_color"
      set -g pane-active-border-style "fg=$bg_color bg=$bg_color"
      set -sg escape-time 10 
     '';

  };

  programs.starship = {
    enable = true;
    enableFishIntegration = true;
    # enableTransience = false;
    settings = {
      add_newline = true;
      character = {
        success_symbol = "[λ ➜](bold green)";
        error_symbol = "[❯](bold red)";
      };
    };
  };

  programs.zoxide = {
    enable = true;
    enableFishIntegration = true;
    options = [
      # "--no-aliases"
    ];
  };
  
  # programs.neovim = {
  #   enable = true;
  #   viAlias = true;
  #   vimAlias = true;
  #   withPython3 = true;
  #   plugins = with pkgs.vimPlugins; [
  #     neovim-sensible
  #     nvim-surround
  #     nvim-treesitter
  #     # nvim-cmp
  #     vim-easymotion
  #     {
  #       plugin = jedi-vim;
  #       config = '' 
  #         let g:jedi#environment_path = "/home/kemal/miniconda3/bin/python3.9"
  #         let g:pymode_rope = 0
  #       '';}
  #     # vim-sendtowindow
  #     # comfortable-motion.vim
  #     #{
  #      # plugin = ncm2-look.vim;
  #       #config = '' let g:ncm2_look_enabled = 0 '';
  #   

  #     {
  #       plugin = vim-isort;
  #     config = ''let g:vim_isort_map = '<C-i>' '';}

  #     {

  #       plugin = ale;
  #       config = ''
  #         let g:ale_sign_column_always=1
  #         let g:ale_lint_on_enter=1
  #         let g:ale_lint_on_text_changed='always'
  #         let g:ale_echo_msg_error_str='E'
  #         let g:ale_echo_msg_warning_str='W'
  #         let g:ale_echo_msg_format='[%linter%] %s [%severity%]: [%...code...%]'
  #         let g:ale_linters={'python': ['flake8'], 'r': ['lintr']}
  #         let g:ale_fixers={'python': ['black']}

  #         '';

  #     }

  #     {
  #       plugin = nerdtree;
  #       config = ''
  #         map <C-n> :NERDTreeToggle<CR>
  #         let NERDTreeIgnore = ['\.pyc$']

  #       '';

  #     }

  #     vim-nix

  #     # nvim-yarp
  #     # ncm2-bufword
  #     # ncm2-path

  #     vim-startify
  #     SimpylFold

  #     vim-airline
  #     {
  #         plugin = vim-airline-themes;
  #         config = ''
  #           let g:airline_themes='wombat'
  #         '';
  #     }
  #     
  #     vim-airline-clock
  #     # vim-commentary
  #     # vim-fugitive
  #     # vim-gitgutter
  #     # vim-indent-guides

  #     {
  #       plugin = dracula-vim;
  #       config = ''
  #         syntax enable
  #         colorscheme dracula
  #       '';
  #     }
  #   ];
  #   extraConfig = ''
  #     set cursorline
  #     set scrolloff=5
  #   '';
  # };
}

