local M = {

    "windwp/nvim-spectre",
    event = "VeryLazy",
}

function M.init()
    vim.keymap.set("n", "<leader>rp", function()
        require("spectre").open()
    end, { desc = "Replace characters in all files in the current workspace" })
    vim.keymap.set("n", "<leader>rf", function()
        require("spectre").open_file_search()
    end, { desc = "Replace all characters in the current file" })
    vim.keymap.set("n", "<leader>rwf", function()
        require("spectre").open_visual({
            select_word = true,
            path = vim.fn.fnameescape(vim.fn.expand("%:p:.")),
        })
    end, { desc = "Replace the character under the cursor in the current file" })
    vim.keymap.set("n", "<leader>rwp", function()
        require("spectre").open_visual({ select_word = true })
    end, { desc = "Replace the character under the cursor in all files under the current workspace" })
end

function M.config()
    require("spectre").setup({
        find_engine = {
            -- rg is map with finder_cmd
            ["rg"] = {
                cmd = "rg",
                -- default args
                args = {
                    "--color=never",
                    "--no-heading",
                    "--with-filename",
                    "--line-number",
                    "--column",
                    "--multiline",
                },
            },
        },
    })
end

return M
