{pkgs, ... }: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableAutosuggestions = true;
    enableSyntaxHighlighting = true;
    shellAliases = {
      ls = "ls --color=auto -F";
      nixswitch = "darwin-rebuild switch --flake .#";
      nixup = "pushd ~/src/system-config; nix flake update; nixswitch; popd";
    };

    localVariables = {
      vivid_theme = "catppuccin-macchiato";
    };
    
    plugins = [
      {
        name = "ohmyzsh-macos";
        file = "plugins/macos.zsh";
        src = pkgs.fetchFromGitHub {
          owner = "ohmyzsh";
          repo = "ohmyzsh";
          rev = "c4392a4da31efee36f29a62d3951d5c0fcd7d4e6";
          sha256 = "sha256-cMJCmhtcCAVDFgp6Ryv/5DteSRtwNcemO97as8ill8I=";
        };
      }
      {
        name = "vivid-zsh";
        src = pkgs.fetchFromGitHub {
          owner = "ryanccn";
          repo = "vivid-zsh";
          rev = "a76616c87821e96ae0cbdfb6bf897bffc170a283";
          sha256 = "sha256-E00xQMCmOt6fJ+IO/TrpFvskNa9QnDw/6DKR51T7i+8=";
        };
      }
    ];
  };
}