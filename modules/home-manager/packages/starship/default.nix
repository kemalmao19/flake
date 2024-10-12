{ ... }: {
  programs.starship = {
    enable = true;
    enableFishIntegration = true;
    enableZshIntegration = true; # enableTransience = false;
    settings = {
      add_newline = true;
      character = {
        success_symbol = "[λ=>](bold green)";
        error_symbol = "[❯](bold red)";
      };
    };
  };
}
