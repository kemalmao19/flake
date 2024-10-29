{
  plugins.indent-blankline = {
    enable = true;
    settings = {
      exclude = {
        buftypes = [ "terminal" "quickfix" ];
        filetypes = [
          "checkhealth"
          "help"
          "  Recently used files"
          "lspinfo"
          "packer"
          "TelescopePrompt"
          "TelescopeResults"
          "yaml"
        ];
      };
      indent = { char = "│"; };
      scope = {
        show_end = false;
        show_exact_scope = true;
        show_start = false;
        node_type = {
          "*" = [
            "class"
            "return"
            "function"
            "method"
            "^if"
            "^while"
            "jsx_element"
            "^for"
            "^object"
            "^table"
            "block"
            "arguments"
            "if_statement"
            "else_clause"
            "jsx_element"
            "jsx_self_closing_element"
            "try_statement"
            "catch_clause"
            "import_statement"
            "operation_type"
          ];
        };
      };
    };
  };
}
