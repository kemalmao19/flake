{ pkgs, ... }:
let
  packagedExtension = with pkgs.vscode-extensions; [
    ms-vscode.live-server
    emroussel.atomize-atom-one-dark-theme
    esbenp.prettier-vscode
    formulahendry.auto-close-tag
    chenglou92.rescript-vscode
    prisma.prisma
  ];
  marketplaceExtension = pkgs.vscode-utils.extensionsFromVscodeMarketplace [{
    name = "codeium";
    publisher = "codeium";
    version = "1.16.18";
    sha256 = "1d3v4550c63pnmmq7cgwzdjcwh4pizzdzhss1d3k4wkzds0fsa0l";
  }];
in packagedExtension ++ marketplaceExtension
