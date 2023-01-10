local M = {
    "windwp/nvim-autopairs",
    event = "VeryLazy",
}

function M.config()
    require("nvim-autopairs").setup({
        map_c_h = true, -- Map the <C-h> key to delete a pair
        map_c_w = true, -- map <c-w> to delete a pair if possible
        map_cr = false
    })
end

return M
