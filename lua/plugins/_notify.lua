local M = {
    "rcarriga/nvim-notify",
    event = "VeryLazy",
}

function M.init()
    vim.keymap.set("n", "<leader>fn", ":Notifications<cr>", { desc = "Find notice history" })
end

function M.config()
    local notify = require("notify")

    notify.setup({
        stages = "slide",
        timeout = 2000,
        minimum_width = 50,
        level = "TRACE",
        icons = {
            ERROR = "",
            WARN = "",
            INFO = "",
            DEBUG = "",
            TRACE = "✎",
        },
    })

    vim.notify = notify
end

return M
