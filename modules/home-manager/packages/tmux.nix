{ pkgs, ... }: {
  programs.tmux = {
    enable = true;
    plugins = with pkgs; [
      tmuxPlugins.cpu
      {
        plugin = tmuxPlugins.resurrect;
        extraConfig = "set -g @resurrect-strategy-nvim 'session'";
      }
      {
        plugin = tmuxPlugins.continuum;
        extraConfig = ''
          set -g @continuum-restore 'on'
          set -g @continuum-save-interval '60' # minutes
        '';
      }
    ];
    shell = "${pkgs.fish}/bin/fish";
    extraConfig = ''

      set -g status on
      set -g mouse on

      # clock mode
      setw -g clock-mode-colour blue
    '';

  };
}
