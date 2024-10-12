local status_ok, indent_blankline = pcall(require, "ibl")
if not status_ok then
    return
end

local cfg = {
    enabled = true,
    exclude = {
        buftypes = { "terminal", "nofile" },
        filetypes = {
            "help",
            "startify",
            "dashboard",
            "packer",
            "neogitstatus",
            "NvimTree",
            "Trouble",
        },
    },
    indent = {
        char = "▏",
    },
    whitespace = {},
    scope = {
        show_start = false,
        show_end = false,
        injected_languages = true,
        include = {
            node_type = {
                ["*"] = {
                    "class",
                    "return",
                    "function",
                    "method",
                    "^if",
                    "^while",
                    "jsx_element",
                    "^for",
                    "^object",
                    "^table",
                    "block",
                    "arguments",
                    "if_statement",
                    "else_clause",
                    "jsx_element",
                    "jsx_self_closing_element",
                    "try_statement",
                    "catch_clause",
                    "import_statement",
                    "operation_type",
                },
            },
        },
    },
}
-- vim.g.indent_blankline_show_trailing_blankline_indent = false
-- vim.g.indent_blankline_show_first_indent_level = true
-- vim.g.indent_blankline_use_treesitter = true
-- vim.g.indent_blankline_show_current_context = true
indent_blankline.setup(cfg)
