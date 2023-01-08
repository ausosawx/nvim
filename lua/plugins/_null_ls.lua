local M = {
    -- Easy LSP setting tool
    "jose-elias-alvarez/null-ls.nvim",
    event = "VeryLazy",
    enabled = false,
}

function M.config()
    local null_ls = require("null-ls")

    local diagnostics = null_ls.builtins.diagnostics
    local formatting = null_ls.builtins.formatting

    local sources = {
        formatting.cmake_format,
        diagnostics.markdownlint,
        formatting.stylua,
        formatting.shfmt,
    }

    null_ls.setup({ sources = sources })
end

return M
