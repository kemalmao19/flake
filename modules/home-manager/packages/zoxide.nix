{pkgs, ...}: {
  programs.zoxide = {
    enable = true;
    enableFishIntegration = true;
    enableZshIntegration = true;
    options = [
      # "--no-aliases"
    ];
  };
}