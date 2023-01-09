local M = {
    "lewis6991/gitsigns.nvim",
    event = "VeryLazy",
}

function M.init()
    vim.keymap.set("n", "<leader>gd", "<cmd>Gitsigns diffthis<cr>", { desc = "Open deff view" })
    vim.keymap.set("n", "<leader>gD", "<cmd>Gitsigns toggle_deleted<cr>", { desc = "Show deleted lines" })
    vim.keymap.set({ "n", "v" }, "<leader>gr", "<cmd>Gitsigns reset_hunk<cr>", { desc = "Reset current hunk" })
    vim.keymap.set("n", "<leader>gR", "<cmd>Gitsigns reset_buffer<cr>", { desc = "Reset current buffer" })
    vim.keymap.set(
        "n",
        "<leader>gl",
        "<cmd>Gitsigns toggle_current_line_blame<cr>",
        { desc = "Toggle current line blame" }
    )
    vim.keymap.set(
        "n",
        "<leader>gh",
        "<cmd>lua require'gitsigns'.preview_hunk()<cr>",
        { desc = "Preview current hunk" }
    )
    vim.keymap.set(
        "n",
        "<leader>gH",
        "<cmd>lua require'gitsigns'.blame_linevim.keymap.set(full=true}<cr>",
        { desc = "Show current block blame" }
    )
    vim.keymap.set("n", "[c", function()
        if vim.wo.diff then
            return "[c"
        end
        vim.schedule(function()
            require("gitsigns").prev_hunk()
        end)
        return "<Ignore>"
    end, { expr = true, desc = "Jump to the prev hunk" })
    vim.keymap.set("n", "]c", function()
        if vim.wo.diff then
            return "]c"
        end
        vim.schedule(function()
            require("gitsigns").next_hunk()
        end)
        return "<Ignore>"
    end, { expr = true, desc = "Jump to the next hunk" })
end

function M.config()
    require("gitsigns").setup({
        signcolumn = true,
        numhl = false,
        linehl = false,
        word_diff = false,
        signs = {
            add = { hl = "GitSignsAdd", text = "+", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
            change = {
                hl = "GitSignsChange",
                text = "~",
                numhl = "GitSignsChangeNr",
                linehl = "GitSignsChangeLn",
            },
            delete = {
                hl = "GitSignsDelete",
                text = "-",
                numhl = "GitSignsDeleteNr",
                linehl = "GitSignsDeleteLn",
            },
            topdelete = {
                hl = "GitSignsDelete",
                text = "‾",
                numhl = "GitSignsDeleteNr",
                linehl = "GitSignsDeleteLn",
            },
            changedelete = {
                hl = "GitSignsChange",
                text = "_",
                numhl = "GitSignsChangeNr",
                linehl = "GitSignsChangeLn",
            },
        },
        current_line_blame_opts = {
            virt_text = true,
            virt_text_pos = "eol",
            delay = 100,
            ignore_whitespace = false,
        },
        preview_config = {
            border = "rounded",
            style = "minimal",
            relative = "cursor",
            row = 0,
            col = 1,
        },
    })
end

return M
