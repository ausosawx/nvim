local M = {
    --  Improve yank and put functionalities
    "gbprod/yanky.nvim",
}

function M.init()
    vim.keymap.set("n", "<leader>fy", ":Telescope yank_history<cr>", { desc = "Find Clipboard History" })
    vim.keymap.set("n", "<leader>cy", ":YankyClearHistory<cr>", { desc = "Clear Clipboard History" })
end

function M.config()
    local utils = require("yanky.utils")
    local mapping = require("yanky.telescope.mapping")
    require("yanky").setup({
        {
            picker = {
                telescope = {
                    mappings = {
                        default = mapping.put("p"),
                        i = {
                            ["<c-p>"] = mapping.put("p"),
                            ["<c-k>"] = mapping.put("P"),
                            ["<c-x>"] = mapping.delete(),
                            ["<c-r>"] = mapping.set_register(utils.get_default_register()),
                        },
                        n = {
                            p = mapping.put("p"),
                            P = mapping.put("P"),
                            d = mapping.delete(),
                            r = mapping.set_register(utils.get_default_register()),
                        },
                    },
                },
            },
        },
    })
end

return M
