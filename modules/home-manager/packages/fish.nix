{ pkgs, ... }: {
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
      vin = "nix run github:kemalmao19/nixvim";
      tm = "tmux";
      v = "vim";
      ls = "eza";
    };
  };
}
