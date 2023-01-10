local M = {
    "nvim-treesitter/nvim-treesitter",
    build = function()
        require("nvim-treesitter.install").update({ with_sync = true })
    end,
}

function M.config()
    vim.api.nvim_set_option_value("foldmethod", "expr", {})
    vim.api.nvim_set_option_value("foldexpr", "nvim_treesitter#foldexpr()", {})

    require("nvim-treesitter.configs").setup({
        ensure_installed = {
            "bash",
            "c",
            "cpp",
            "lua",
            "go",
            "json",
            "yaml",
            "latex",
            "make",
            "python",
            "rust",
            "html",
            "javascript",
            "typescript",
            "vue",
            "css",
            "vim",
            "regex",
            "org",
            -- "julia",
        },
        highlight = {
            enable = true,
            disable = { "latex" },
            -- additional_vim_regex_highlighting = { "org", "latex", "markdown" },
        },
        matchup = {
            enable = true,
        },
        indent = {
            enable = true,
        },
    })
end

return M
