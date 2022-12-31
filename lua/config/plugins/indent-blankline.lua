local M = {
    "lukas-reineke/indent-blankline.nvim",
    event = "VeryLazy"
}

function M.config()
    require("indent_blankline").setup({
        filetype_exclude = {
            "NvimTree",
            "aerial",
            "spectre_panel",
            "toggleterm",
            "notify",
            "startuptime",
            "packer",
            "help",
            "terminal",
            "lspinfo",
            "TelescopePrompt",
            "TelescopeResults",
            "", -- for all buffers without a file type
        },
        show_current_context_start = false,
        show_current_context = true,
        show_end_of_line = true,
    })
end

return M
