local M = {

    -- neovim easy motion
    "phaazon/hop.nvim",
    branch = "v2",
    cmd = { "HopWord", "HopLine", "HopChar1", "HopChar1CurrentLine" },
}

function M.init()
    vim.keymap.set({ "n", "v" }, "ss", "<cmd>HopWord<cr>", { desc = "Jump to word head" })
    vim.keymap.set({ "n", "v" }, "sl", "<cmd>HopLine<cr>", { desc = "Jump to line" })
    vim.keymap.set({ "n", "v" }, "sf", "<cmd>HopChar1<cr>", { desc = "Jump to search char on buffer" })
    vim.keymap.set({ "n", "v" }, "sc", "<cmd>HopChar1CurrentLine<cr>", { desc = "Jump to search char on current line" })
end

function M.config()
    require("hop").setup({ keys = "etovxqpdygfblzhckisuran" })
end

return M
