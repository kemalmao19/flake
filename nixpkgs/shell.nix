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
      py = "python";
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
      neovim-sensible
      nvim-surround
      nvim-treesitter
      nvim-cmp
      vim-easymotion
      jedi-vim
      # vim-sendtowindow
      # comfortable-motion.vim
      #{
       # plugin = ncm2-look.vim;
        #config = '' let g:ncm2_look_enabled = 0 '';
    

      {
        plugin = vim-isort;
      config = ''let g:vim_isort_map = '<C-i>' '';}


      {

        plugin = ale;
        config = ''
          let g:ale_sign_column_always=1
          let g:ale_lint_on_enter=1
          let g:ale_lint_on_text_changed='always'
          let g:ale_echo_msg_error_str='E'
          let g:ale_echo_msg_warning_str='W'
          let g:ale_echo_msg_format='[%linter%] %s [%severity%]: [%...code...%]'
          let g:ale_linters={'python': ['flake8'], 'r': ['lintr']}
          let g:ale_fixers={'python': ['black']}

          '';

      }

      {
        plugin = nerdtree;
        config = ''
          map <C-n> :NERDTreeToggle<CR>
          let NERDTreeIgnore = ['\.pyc$']

        '';

      }

      vim-nix

      nvim-yarp
      ncm2-bufword
      ncm2-path

      vim-startify
      SimpylFold

      vim-airline
      {
          plugin = vim-airline-themes;
          config = ''
            let g:airline_themes='wombat'
          '';
      }
      
      vim-airline-clock
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

