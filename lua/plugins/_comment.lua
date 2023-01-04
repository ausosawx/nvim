local M = {
    "numToStr/Comment.nvim",
    event = "VeryLazy",
}

function M.config()
    require("Comment").setup({
        -- LHS of operator-pending mappings in NORMAL and VISUAL mode
        opleader = {
            line = "gc",
            block = "gb",
        },
        -- LHS of toggle mappings in NORMAL mode
        toggler = {
            -- Line-comment toggle keymap
            line = "gcc",
            -- Block-comment toggle keymap
            block = "gbc",
        },
        extra = {
            -- Add comment on the line above
            above = "gcO",
            -- Add comment on the line below
            below = "gco",
            -- Add comment at the end of line
            eol = "gcA",
        },
    })
end

return M
