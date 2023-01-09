local M = {

    "kevinhwang91/nvim-hlslens",
    event = "VeryLazy",
}

function M.init()
    vim.keymap.set("n", "n", function()
        vim.cmd("normal! " .. vim.v.count1 .. "n")
        require("hlslens").start()
    end, { desc = "Skip to next search result" })
    vim.keymap.set("n", "N", function()
        vim.cmd("normal! " .. vim.v.count1 .. "n")
        require("hlslens").start()
    end, { desc = "Jump to previous search result" })
    vim.keymap.set("n", "*", function()
        vim.cmd("normal! " .. vim.v.count1 .. "n")
        require("hlslens").start()
    end, { desc = "Jump to the next word at the current cursor" })
    vim.keymap.set("n", "#", function()
        vim.cmd("normal! " .. vim.v.count1 .. "n")
        require("hlslens").start()
    end, { desc = "Jump to the prev word at the current cursor" })
    vim.keymap.set("n", "g*", function()
        vim.cmd("normal! " .. vim.v.count1 .. "n")
        require("hlslens").start()
    end, { desc = "Jump to the next word at the current cursor (forbidden range)" })
    vim.keymap.set("n", "g#", function()
        vim.cmd("normal! " .. vim.v.count1 .. "n")
        require("hlslens").start()
    end, { desc = "Jump to the prev word at the current cursor (forbidden range)" })
end

function M.config()
    require("hlslens").setup({
        -- automatically clear search results
        calm_down = true,
        -- set to the nearest match to add a shot
        nearest_only = true,
    })
end

return M
