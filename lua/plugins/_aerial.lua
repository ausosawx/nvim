local M = {
    "stevearc/aerial.nvim",
    event = "VeryLazy",
}

function M.config()
    require("aerial").setup({
        show_guides = true,
        backends = { "lsp", "treesitter", "markdown" },
        update_events = "TextChanged,InsertLeave",
        lsp = {
            diagnostics_trigger_update = true,
            update_when_errors = true,
            update_delay = 300,
        },
        guides = {
            mid_item = "├─",
            last_item = "└─",
            nested_top = "│ ",
            whitespace = "  ",
        },
        filter_kind = {
            "Module",
            "Struct",
            "Interface",
            "Class",
            "Constructor",
            "Enum",
            "Function",
            "Method",
        },
    })
end

return M
