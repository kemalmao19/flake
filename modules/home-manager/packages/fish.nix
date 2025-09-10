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
      gaa = "git add *";
      gpull = "git pull";
      gpush = "git push";
      py = "python";
      startdb = "systemctl start mysql";
      stopdb = "systemctl stop mysql";
      statdb = "systemctl status mysql";
      nixpkg = "nix-env -iA nixpkgs.";
      nixospkg = "nix-env -iA nixos.";
      vin = "nix run github:kemalmao19/flake#nixvim";
      tm = "tmux";
      v = "nvim";
      ls = "eza";
      y = "yazi";
      nswitch = "sudo nixos-rebuild switch --flake ~/flake/.#kemalmao";
      nboot = "sudo nixos-rebuild boot --flake ~/flake/.#kemalmao";
    };
    interactiveShellInit = ''
      set fish_greeting # Disable greeting
    '';
    shellInit = ''
      # zellij initialization
      # if status is-interactive
      #           eval (zellij setup --generate-auto-start fish | string collect)
      #       end

      # caelestia
      if status is-interactive
          # Starship custom prompt
          starship init fish | source

          # Custom colours
          cat ~/.local/state/caelestia/sequences.txt 2> /dev/null

          # For jumping between prompts in foot terminal
          function mark_prompt_start --on-event fish_prompt
              echo -en "\e]133;A\e\\"
          end
      end

      # yazi wrapper
      function y
      	set tmp (mktemp -t "yazi-cwd.XXXXXX")
      	yazi $argv --cwd-file="$tmp"
      	if read -z cwd < "$tmp"; and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
      		builtin cd -- "$cwd"
      	end
       	rm -f -- "$tmp"
      end
    '';
  };
}
