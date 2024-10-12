{ inputs, fetchurl, ... }: {
  flake.overlays.default = final: prev: {
    # rescript
    tree-sitter-grammars = prev.tree-sitter-grammars // {
      tree-sitter-rescript = prev.tree-sitter.buildGrammar {
        version = inputs.ts-rescript.lastModifiedDate;
        language = "rescript";
        generate = true;
        src = inputs.ts-rescript;
      };
    };
    # nodePackages = prev.nodePackages // {
    #   rescript-language-server = prev.buildNodePackage {
    #     name = "rescript language server";
    #     packageName = "@rescript/language-server";
    #     src = fetchurl {
    #       url =
    #         "https://registry.npmjs.org/@rescript/language-server/-/language-server-1.58.0.tgz";
    #       sha512 =
    #         "0m0j9immcwg97qrcwl0y3yd0hqjymrc321wcdc5b28m3c9w1snxrpr2g95617jr4hnwzrh4qi1hj5lb4wi5vialip7fb3cw2prh2f30";
    #     };
    #   };
    # };
  };
}
