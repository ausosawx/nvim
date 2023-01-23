local M = {
    "folke/noice.nvim",
    event = "VeryLazy",
    -- enabled = false,
    dependencies = "MunifTanjim/nui.nvim",
}

function M.config()
    require("noice").setup({
        presets = {
            bottom_search = true,
            command_palette = true,
            long_message_to_split = true,
            inc_rename = false,
            lsp_doc_border = false,
        },
        messages = {
            enabled = false,
        },
        lsp = {
            signature = {
                enabled = false,
            },
        },
    })
end

return M
