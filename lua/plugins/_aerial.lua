local M = {
    "stevearc/aerial.nvim",
    event = "VeryLazy",
}

function M.init()
    vim.keymap.set("n", "<leader>2", "<cmd>AerialToggle<cr>", { desc = "Open Outilne Explorer" })
    vim.keymap.set("n", "[[", function()
        require("aerial").prev_up()
    end, { desc = "Move up one level" })
    vim.keymap.set("n", "]]", function()
        require("aerial").next_up()
    end, { desc = "Move down one level" })
end

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
