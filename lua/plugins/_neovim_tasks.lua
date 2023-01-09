local M = {
    -- integration with build systems such as cmake
    "Shatur/neovim-tasks",
    ft = { "c", "cpp", "hpp", "cmake" },
}

function M.init()
    vim.keymap.set("n", "<leader>cc", ":Task start cmake configure<cr>", { desc = "cmake configure" })
    vim.keymap.set("n", "<leader>ct", ":Task set_module_param cmake target<cr>", { desc = "select target" })
    vim.keymap.set("n", "<leader>cr", ":Task start cmake run<cr>", { desc = "cmake run" })
    vim.keymap.set("n", "<leader>cd", ":Task start cmake debug<cr>", { desc = "nvim-dap debug" })
end

function M.config()
    require("tasks").setup({
        default_params = {
            cmake = {
                dap_name = "codelldb",
            },
        },
    })
end

return M
