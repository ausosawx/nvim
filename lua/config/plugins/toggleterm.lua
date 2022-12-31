local M = {
    "akinsho/toggleterm.nvim",
    event = "VeryLazy",
}

function M.config()
    require("toggleterm").setup({
        start_in_insert = true,
        shade_terminals = true,
        shading_factor = 1,
        autochdir = true,
        shell = vim.o.shell,
        size = function(term)
            if term.direction == "horizontal" then
                return vim.o.lines * 0.25
            elseif term.direction == "vertical" then
                return vim.o.columns * 0.25
            end
        end,
        -- Use catppuccin highlights
        highlights = {
            Normal = {
                link = "Normal",
            },
            NormalFloat = {
                link = "NormalFloat",
            },
            FloatBorder = {
                link = "FloatBorder",
            },
        },
    })
end

return M
