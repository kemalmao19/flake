{ pkgs, ... }: {
  programs.tmux = {
    enable = true;
    plugins = with pkgs; [ tmuxPlugins.catppuccin ];
    shell = "\${pkgs.fish}/bin/fish";
    extraConfig = ''

      set -g status on
      set -g mouse on

      # clock mode
      setw -g clock-mode-colour blue
    '';

  };
}
