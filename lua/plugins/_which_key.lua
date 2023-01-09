local M = {
    -- Show possible keybindings
    "folke/which-key.nvim",
    event = "VeryLazy",
}

function M.config()
    local which_key = require("which-key")
    which_key.setup({
        plugins = {
            spelling = {
                enabled = true,
                suggestions = 20,
            },
        },
        icons = {
            breadcrumb = " ",
            separator = " ",
            group = " ",
        },
    })
    which_key.register({
        b = { name = "Buffers" },
        d = { name = "Debug" },
        f = { name = "Find" },
        r = { name = "Replace", w = "Replace Word To ..." },
        t = { name = "Terminal" },
        g = { name = "Git" },
        p = { name = "Plugins" },
        c = { name = "Cmake", s = "Select type or target" },
        o = { name = "Org" },
    }, { prefix = "<leader>", mode = "n" })

    -- comment
    which_key.register({
        c = {
            name = "Comment Line",
        },
        b = {
            name = "Comment Block",
        },
    }, { prefix = "g", mode = "n" })
end

return M
