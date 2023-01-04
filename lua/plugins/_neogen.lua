local M = {
    -- Annotation Toolkit
    "danymat/neogen",
    event = "VeryLazy",
}

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
