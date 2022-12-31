local M = {
    "RRethy/vim-illuminate",
    event = "VeryLazy",
}

function M.config()
    require("illuminate").configure({
        providers = {
            "lsp",
            "regex",
            "treesitter",
        },
        delay = 100,
        filetypes_denylist = {
            "alpha",
            "dashboard",
            "DoomInfo",
            "fugitive",
            "help",
            "norg",
            "NvimTree",
            "Outline",
            "packer",
            "toggleterm",
        },
        under_cursor = false,
    })
end

return M
