local M = {
    -- Annotation Toolkit
    "danymat/neogen",
    event = "VeryLazy",
}

function M.init()
    vim.keymap.set("n", "<leader>n", function()
        vim.ui.select({ "func", "file", "class", "type" }, _, function(choice)
            require("neogen").generate({ type = choice })
        end)
    end, { desc = "Create annotations" })
end

function M.config()
    -- local ok
    require("neogen").setup({
        enabled = true,
        snippet_engine = "luasnip",
        languages = {
            lua = {
                template = {
                    annotation_convention = "emmylua",
                },
            },
            python = {
                template = {
                    annotation_convention = "google_docstrings",
                    -- annotation_convention = "numpydoc",
                },
            },
        },
    })
end

return M
